clc;clear;close all;
video = "test_cxk.mp4";
vidObj = VideoReader(video);
%��ȡ��֡��
a=2;
nFrames = vidObj.NumberOfFrames;
vFrameRate = vidObj.FrameRate;
fs=44100;
[audio_input, fs] = audioread(video);
fprintf('��ʼ��ȡ��ת��֡\n');
for i = 1 : nFrames
     frame = read(vidObj,i);%��ȡĳ֡
     %imwrite(frame,fullfile('cxk\',[num2str(i) '.jpg']));
     frame=rgb2gray(frame);
     % imshow(frame);
     thresh = graythresh(frame);     %�Զ�ȷ����ֵ����ֵ
     frame = imbinarize(frame,0.6);       %��ͼ���ֵ��
     
     w = fspecial('gaussian',[3,3],2);
	 frame = imfilter(frame,w,'replicate');

     frame=medfilt2(frame,[5 5]); %��ֵ�˲�

     imwrite(frame,fullfile('cxk2\',[num2str(i) '.jpg']));%i
     fprintf('����ת����%d֡...\n',i);
end
fprintf('��ȡ���\n');
fprintf('��ʼ ����̫�� ...\n');
test_cxk_readpic2();
fprintf('�������\n');

%clear sound