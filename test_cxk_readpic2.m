
function test_cxk_readpic();
video = "test_cxk.mp4";
vidObj = VideoReader(video);

%��ȡ��֡��
a=2;
nFrames = vidObj.NumberOfFrames;
vFrameRate = vidObj.FrameRate;

[audio_input, fs] = audioread(video);
sound(audio_input, fs);


for i = 1 : nFrames
    
    t1=clock;
    frame = imread(fullfile('cxk2\',[num2str(i) '.jpg']));
%     if(xx==1)
%         sound(audio_input, fs);
%         xx=0;
%     end
    image(frame);
    colormap(gray);
    t2=clock;
    %pause(1/(vFrameRate)-(t2(6)-t1(6)));%������ʱ
    pause(0.0015);%������ʱ
end

close;

end
