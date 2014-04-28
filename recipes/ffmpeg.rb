# Add repository to install the *real* FFmpeg
# from: https://launchpad.net/~jon-severinsson/+archive/ffmpeg

apt_repository "jon-severinsson_ffmpeg.ppa" do
  uri "http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "CFCA9579"
  distribution node['lsb']['codename']
  components ["main"]
end