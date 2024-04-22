% Generate the signal
n = 0:399;
x1 = sin(0.24*pi*n(1:200));
x2 = sin(0.72*pi*n(201:400));
x = [x1, x2];

% Plot the signal
plot(n, x);
xlabel('Sample Index (n)');
ylabel('Amplitude');
title('Plot of Signal x');


% Plot the amplitude spectrum using LCPS
figure();
LCPS_plot(x);
title('Amplitude Spectrum of Signal x');

%(c)
figure();
LCPS_plot(x.*rectwin(length(x))')
title('Amplitude Spectrum with rectangular window of Signal x');
xlabel('Normalized freq');
ylabel('Amplitude');

%(d)
figure();
LCPS_plot(x.*hamming(length(x))')
title('Amplitude Spectrum with hamming window of Signal x');
xlabel('Normalized freq');
ylabel('Amplitude');

%(e)
n = 0:399;
x3 = sin(0.72*pi*n(1:200));
x4 = sin(0.24*pi*n(201:400));
x_reverse = [x3, x4];

figure();
plot(n, x_reverse);
xlabel('Sample Index (n)');
ylabel('Amplitude');
title('Plot of Signal x_reverse');

%(f)
% Define the parameters
n_window = 1:500;
g = hamming(100);

% Compute the FFT with sliding window using LCPS
[X, f, n] = LCPS_swifft(x, g, n_window);

% 1g
figure();
spectrogram(x, hamming(100), 90, 'yaxis'); % window move by 100 - 90 samples
% 'yaxis' for better representation
title('Spectrogram of x, hamming 100');
grid on;

% Task 2 - 1g, but with smaller windows
figure();
spectrogram(x, hamming(80), 70, 'yaxis')
title('Spectrogram of x, hamming 80');
grid on;

figure();
spectrogram(x, hamming(60), 50, 'yaxis')
title('Spectrogram of x, hamming 60');
grid on;
