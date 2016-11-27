function video = loadVideo(path)
  v = VideoReader(path);
  
  numberOfFrames = v.NumberOfFrames;
  v = VideoReader(path);
  
  beginFrame = 100;%1;%
  debugFrameNumber = 200;%numberOfFrames;%
  numberOfFrames = debugFrameNumber; %DEBUG
  
  x = 1:numberOfFrames; %linspace containing frame indices from beginFrame to endFrame ("time axis")
  histData = cell(12, debugFrameNumber);%numberOfFrames); %contains 4 hist data for each colour per column/frame
  histDataMat = zeros(12, debugFrameNumber);
  
  figure, hold on
  
  i = 0;
  while hasFrame(v)
      i = i + 1;
      if i < beginFrame
          readFrame(v);
          continue;
      end
      video = readFrame(v);

      % we only need the upper middle of the frame (and watch whether there is blue in it)
      videoPart = video(1:size(video,1)/2 , size(video,2)/4:3*size(video,2)/4 -1, :);
      
      % show the whole video and the upper middle part
      subplot(2,2,1), imshow(video);
      subplot(2,2,2), imshow(videoPart);
      video = videoPart; % if active, only the upper middle part is used
      
      %Split into RGB Channels
      Red = video(:,:,1);
      Green = video(:,:,2);
      Blue = video(:,:,3);
      
      % percentage done
      disp((i - beginFrame)/(debugFrameNumber - beginFrame) * 100);
      
       %Get histValues for each channel
      [yRed, ] = imhist(Red,4);
      [yGreen, ] = imhist(Green,4);
      [yBlue, ] = imhist(Blue,4);

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
      
      histDataMat(:,i) = cell2mat(histData(:,i));
      subplot(2,2,4), plot(x, histDataMat(1,:), 'r-.', ... % 0-64 red -.-.-
          x, histDataMat(2,:), 'r:', ...    % 65-128 red dotted
          x, histDataMat(3,:), 'r--', ...   % 129-192 red  - - - -
          x, histDataMat(4,:), 'r-', ...    % 193-256 red line
          x, histDataMat(5,:), 'g-.', ...   % 0-64 green -.-.-
          x, histDataMat(6,:), 'g:', ...    % 65-128 green dotted
          x, histDataMat(7,:), 'g--', ...   % 129-192 green  - - - -
          x, histDataMat(8,:), 'g-', ...    % 193-256 green line
          x, histDataMat(9,:), 'b-.', ...   % 0-64 blue -.-.-
          x, histDataMat(10,:), 'b:', ...   % 65 -128 blue dotted
          x, histDataMat(11,:), 'b--', ...  % 129-192 blue  - - - -
          x, histDataMat(12,:), 'b-');      % 193-256 blue line
      drawnow;
      
      if i >= debugFrameNumber
          break;
      end
  end
  
  % do stuff
  
end