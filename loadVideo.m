function video = loadVideo(path)
  v = VideoReader(path);
  
  numberOfFrames = v.NumberOfFrames;
  v = VideoReader(path);
  
  beginFrame = 130;%1;%
  debugFrameNumber = 180;%numberOfFrames;%
  histData = cell(12, debugFrameNumber);%numberOfFrames);
 
  i = 0;
  while hasFrame(v)
      i = i + 1;
      if i < beginFrame
          readFrame(v);
          continue;
      end
      video = readFrame(v);

      %Split into RGB Channels
      Red = video(:,:,1);
      Green = video(:,:,2);
      Blue = video(:,:,3);

      %Get histValues for each channel
      disp((i - beginFrame)/(debugFrameNumber - beginFrame) * 100);
      [yRed, x] = imhist(Red,4);
      [yGreen, x] = imhist(Green,4);
      [yBlue, x] = imhist(Blue,4);

      histData{1,i} = yRed(1);
      histData{2,i} = yRed(2);
      histData{3,i} = yRed(3);
      histData{4,i} = yRed(4);
      
      histData{5,i} = yGreen(1);
      histData{6,i} = yGreen(2);
      histData{7,i} = yGreen(3);
      histData{8,i} = yGreen(4);
      
      histData{9,i} = yBlue(1);
      histData{10,i} = yBlue(2);
      histData{11,i} = yBlue(3);
      histData{12,i} = yBlue(4);
     
      if i >= debugFrameNumber
          figure, imshow(video);
          break;
      end
  end 
  
  numberOfFrames = debugFrameNumber;
  x = beginFrame:numberOfFrames;
  histData = cell2mat(histData);
  figure, plot(x, histData(1,:), 'r-.', ...
       x, histData(2,:), 'r:', ...
       x, histData(3,:), 'r--', ...
       x, histData(4,:), 'r-', ...
       x, histData(5,:), 'g-.', ...
       x, histData(6,:), 'g:', ...
       x, histData(7,:), 'g--', ...
       x, histData(8,:), 'g-', ... 
       x, histData(9,:), 'b-.', ...
       x, histData(10,:), 'b:', ...
       x, histData(11,:), 'b--', ...
       x, histData(12,:), 'b-');
       
  %Plot them together in one plot
  %plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
  
end