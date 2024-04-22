clear all

fs = 44100; % Adjust as needed
N = 8000;
%probably use 
% audioData = LCPS_getdata(N, 1, 1/fs);
% 

% part bellow is written by chat, probably is wrong use LCPS_getdata from above
% instead
% recorder = audiorecorder(fs, 16, 1); % 16 bits, 1 channel (mono)     probably use LCPS_getdata(N, 1, Ts);
% recordblocking(recorder, 8000/fs);
%audioData = getaudiodata(recorder);


windowLength = 256; % Adjust as needed
overlap = windowLength / 2; % Adjust as needed
figure;
spectrogram(audioData, hamming(windowLength), overlap, [], fs, 'yaxis');
title('Spectrogram of Recorded Audio');
xlabel('Time (s)');
ylabel('Frequency (Hz)');


% Zoom in on a specific time range
startSample = 1000; % Adjust as needed
endSample = 3000;   % Adjust as needed
zoomedAudio = audioData(startSample:endSample);
figure;
spectrogram(zoomedAudio, hamming(windowLength), overlap, [], fs, 'yaxis');
title('Zoomed Spectrogram of Recorded Audio');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
