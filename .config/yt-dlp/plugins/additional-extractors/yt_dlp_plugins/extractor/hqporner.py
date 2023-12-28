from yt_dlp.extractor.common import InfoExtractor
from yt_dlp.extractor.generic import GenericIE
import re
import lxml.html

class hqpornerIE(InfoExtractor):
	_VALID_URL = r'https?://hqporner.com/hdporn/(?P<id>\d+-.+)\.html'
	_TESTS = [{
		'url': 'https://hqporner.com/hdporn/82041-seduced_by_my_stepmom.html',
		'md5': '',
		'info_dict': {
			'id': '82041',
			'ext': 'mp4',
			'title': 'seduced by my stepmom',
			'thumbnail': r're:^https?://.*\.jpg$',
		}
	}]

	def _real_extract(self, url):
		video_id = self._match_id(url)
		webpage = self._download_webpage(url, video_id)

		tree = lxml.html.fromstring(webpage)

		title = tree.cssselect('h1.main-h1')[0].text_content()

		iframeUrl = tree.cssselect('iframe[allowfullscreen]')[0].get('src')
		if iframeUrl.startswith('//'):
			iframeUrl = 'https:' + iframeUrl

		durationString = tree.cssselect('ul.meta li.icon.fa-clock-o')[0].text_content().strip(" ")
		durationSeconds = 0
		if re.match(r'(?:\d+h )?(?:\d+m )?(?:\d+s)?', durationString):
			for token in durationString.split(' '):
				if token.endswith('h'):
					durationSeconds += int(token[:-1]) * 3600
				elif token.endswith('m'):
					durationSeconds += int(token[:-1]) * 60
				elif token.endswith('s'):
					durationSeconds += int(token[:-1])
	
		
		iframeWebpage = self._download_webpage(iframeUrl, None)

		formats = []
		for match in re.findall(r'<source\s*src=\\"([^"]+/\d+\.mp4)\\"', iframeWebpage):
			videoUrl = re.search(r'<source\s*src=\\"([^"]+/\d+\.mp4)\\"', iframeWebpage).group(1)
			height = int(re.search(r'/(\d+)\.mp4', videoUrl).group(1))
			formats.append({
				'url': videoUrl,
				'height': height,
				'ext': 'mp4'
			})


		return {
			'id': video_id,
			'title': title,
			'formats': formats,
			'duration': durationSeconds
		}

if __name__ == '__main__':
	from yt_dlp import YoutubeDL
	URLS = ['https://www.porndig.com/videos/51534/gina-gerson-is-a-flexible-young-slut.html']
	with YoutubeDL() as ydl:
		ydl.download(URLS)