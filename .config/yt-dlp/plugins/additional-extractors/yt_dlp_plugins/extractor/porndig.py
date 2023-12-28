from yt_dlp.extractor.common import InfoExtractor
from yt_dlp.extractor.generic import GenericIE
import re
import lxml.html

class porndigIE(InfoExtractor):
	_VALID_URL = r'https?://www.porndig.com/videos/(?P<id>\d+)/.*\.html'
	_TESTS = [{
		'url': 'https://www.porndig.com/videos/51534/gina-gerson-is-a-flexible-young-slut.html',
		'md5': '',
		'info_dict': {
			'id': '196064',
			'ext': 'mp4',
			'title': 'The latina Yinyleon gives us big ass porn',
		}
	}]

	def _real_extract(self, url):
		video_id = self._match_id(url)
		webpage = self._download_webpage(url, video_id)

		tree = lxml.html.fromstring(webpage)

		title = tree.cssselect('.title_text h1')[0].text_content().strip(' ')


		formats = []
		for downloadEntry in tree.cssselect(".post_download_wrapper a.post_download_link"):
			if len(downloadEntry.cssselect(".file_size")) == 1:
				fileSizeString = downloadEntry.cssselect(".file_size")[0].text_content().strip(" ")
				number, unit = re.search(r'(\d+(?:[,.]\d+)?)\s*(.{2})', fileSizeString).groups()

				if unit.lower() == "mb":
					fileSizeInBytes = int(float(number) * 1024**1)
				elif unit.lower() == "kb":
					fileSizeInBytes = int(float(number) * 1024**2)
				elif unit.lower() == "gb":
					fileSizeInBytes = int(float(number) * 1024**3)

				formats.append({
					"filesize_approx": fileSizeInBytes,
					"url": downloadEntry.get("href"),
					"ext": "mp4"
				})

		return {
			'id': video_id,
			'title': title,
			'formats': formats
		}

if __name__ == '__main__':
	from yt_dlp import YoutubeDL
	URLS = ['https://www.porndig.com/videos/51534/gina-gerson-is-a-flexible-young-slut.html']
	with YoutubeDL() as ydl:
		ydl.download(URLS)