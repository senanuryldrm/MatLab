% Sig gen
x1 = sin(0.24 * pi * (0:199)); % theta = 0.24pi, fn = 0.12
x2 = sin(0.72 * pi * (200:399)); % theta = 0.72pi, fn = 0.36
x = [x1 x2]; % Concatenate x2 to the end of x1

% 1a
figure;
plot(x);
title('Signal x');
xlabel('Sample');
ylabel('Amplitude');

% 1b
figure;
LCPS_plot(x);
title('Amplitude spectrum of sig x');
xlabel('Normalized freq');
ylabel('Amplitude');

% 1c
% Should be same as 1b?
figure;
LCPS_plot(x.*rectwin(length(x))');
title('Amplitude spectrum of x with rectwin');
xlabel('Normalized freq');
ylabel('Amplitude');

% 1d
figure;
LCPS_plot(x.*hamming(length(x))');
title('Amplitude spectrum with hamming');
xlabel('Normalized freq');
ylabel('Amplitude');

% 1e
xe = [x2 x1]; % x signal for subtask e
figure;
LCPS_plot(xe);
title('Amplitude spectrum. Reversed order of freq in x');
xlabel('Normalized freq');
ylabel('Amplitude');


% 1g
figure;
spectrogram(x, hamming(100), 90, 'yaxis'); % window move by 100 - 90 samples
% 'yaxis' for better representation
title('Spectrogram of x, hamming 100');
grid on;

% Task 2 - 1g, but with smaller windows
figure;
spectrogram(x, hamming(80), 70, 'yaxis')
title('Spectrogram of x, hamming 80');
grid on;

figure;
spectrogram(x, hamming(60), 50, 'yaxis')
title('Spectrogram of x, hamming 60');
grid on;

% Smaller window means smaller frequency sample width during the switch of
% freq in the middle (smaller sample bar width)
% But lower resolution regarding the frequencies (bigger width of bar freq)


