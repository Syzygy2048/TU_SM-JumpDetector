function video = loadVideo(path)
  v = VideoReader(path);
  while hasFrame(v)
    imshow(readFrame(v));
  end
end