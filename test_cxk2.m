clc;clear;close all;
video = "test_cxk.mp4";
vidObj = VideoReader(video);
%读取总帧数
a=2;
nFrames = vidObj.NumberOfFrames;
vFrameRate = vidObj.FrameRate;
fs=44100;
[audio_input, fs] = audioread(video);
fprintf('开始提取并转换帧\n');
for i = 1 : nFrames
     frame = read(vidObj,i);%读取某帧
     %imwrite(frame,fullfile('cxk\',[num2str(i) '.jpg']));
     frame=rgb2gray(frame);
     % imshow(frame);
     thresh = graythresh(frame);     %自动确定二值化阈值
     frame = imbinarize(frame,0.6);       %对图像二值化
     
     w = fspecial('gaussian',[3,3],2);
     frame = imfilter(frame,w,'replicate');

     frame=medfilt2(frame,[5 5]); %中值滤波

     imwrite(frame,fullfile('cxk2\',[num2str(i) '.jpg']));%i
     fprintf('正在转换第%d帧...\n',i);
end
fprintf('提取完毕\n');
fprintf('开始 鸡你太美 ...\n');
test_cxk_readpic2();
fprintf('播放完毕\n');

%clear sound