function video = loadVideo(path)
  pkg load video;
  
 %% video = aviread(path,1);
  %%imshow(video);
  
  
  
  %% the code below tries to load the video into an avifile, although I'm not sure what to do with that
  %% might be better to load it into a frame array with aviread like demonstrated above
  %% in both cases the load times are quite long and the sizes (indices) get to large for octave
  %% could try loading it into individual frames or 100 frame chunks
  
  %%fileinfo = aviinfo(path);
  
  
  %%time = clock();
  
  %%video = avifile("test");
  %%disp("starting to load");
  %%for i = 1:fileinfo.NumFrames
  %%  addframe(video,aviread(path, i));
    
    %%if 0 == mod(fileinfo.NumFrames, fix(fileinfo.NumFrames * 0.05))
    %%  disp(strcat("Loading File - ", num2str(i/fileinfo.NumFrames), "%"));
    %%endif
  %%endfor
  %%disp(strcat("loading took ", num2str(etime(clock(), time)), " seconds"));
    
    
    
 endfunction