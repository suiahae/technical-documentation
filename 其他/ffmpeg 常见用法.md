
NVIDIA 压缩 + 硬字幕
ffmpeg.exe -y -vsync 0 -i source.mkv -vf subtitles=subtitle.srt -b:v 1.5M -c:v h264_nvenc output.compressed.mp4

CPU 压缩 + 硬字幕
ffmpeg.exe -i source.mkv -vf subtitles=subtitle.srt -b:v 1.5M output.compressed.mp4

CPU 压缩 + 软字幕
ffmpeg.exe -i source.mkv -vf -i subtitle.srt -b:v 1.5M output.compressed.mp4

剪切
ffmpeg.exe -ss 00:00:00 -t 04:00:54 -i source.mkv -vcodec copy -acodec copy output.mkv