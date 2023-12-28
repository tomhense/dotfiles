from yt_dlp.extractor.common import InfoExtractor
from yt_dlp.extractor.generic import GenericIE
import re
import lxml.html

class studyflixIE(InfoExtractor):
	_VALID_URL = r'https?://studyflix.de/.*/.*-(?P<id>\d+)'
	_TESTS = [{
		'url': 'https://studyflix.de/wirtschaft/okonomisches-prinzip-1613',
		'md5': '',
		'info_dict': {
			'id': '1613',
			'ext': 'mp4',
			'title': 'Ökonomisches Prinzip',
		}
	}]

	def _real_extract(self, url):
		video_id = self._match_id(url)
		webpage = self._download_webpage(url, video_id)

		m3u8Url = self._html_search_meta("contentUrl", webpage)

		tree = lxml.html.fromstring(webpage)
		title = tree.cssselect('.video-content-head h1')[0].text_content()

		formats = GenericIE._extract_m3u8_formats(self, m3u8Url, video_id, 'mp4', entry_protocol='m3u8_native', m3u8_id='hls', fatal=False)

		# The error message in the ffmpeg fixup step is fixable by adding the paramter '-analyzeduration 100M' to the
		# start of the ffmpeg command. It seems that it is impossible to fix this issue from within this extractor as the
		# ffmpeg command is executed from the postprocessor/ffmpeg.py file and no hooks are available to modify the command.

		return {
			'id': video_id,
			'title': title,
			'formats': formats
		}

if __name__ == '__main__':
	from yt_dlp import YoutubeDL
	URLS = ['https://studyflix.de/wirtschaft/okonomisches-prinzip-1613']
	with YoutubeDL() as ydl:
		ydl.download(URLS)