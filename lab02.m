% Signal (a) - Square impulse
signal_a = [ones(512, 1); zeros(512, 1)];

% Signal (b) - Narrower square impulses
signal_b = zeros(1024, 1);
signal_b(1:128) = 1;
signal_b(256:384) = 1;
signal_b(512:640) = 1;
signal_b(768:896) = 1;

% Signal (c) - Sine wave with integer number of periods
N0_c = 64; % Period length in samples
n_c = 0:1023;
signal_c = sin(2*pi*n_c/N0_c);

% Signal (d) - Sine wave with non-integer number of periods
N0_d = 64.5; % Period length in samples
n_d = 0:1023;
signal_d = sin(2*pi*n_d/N0_d);

% Signal (e) - jnθc
theta = pi/4; % Change this for different values of θc
n_e = 0:1023;
signal_e = exp(1i * theta * n_e);

% Signal (f) - 32-point square impulse beginning at n = 0
signal_f = zeros(1024, 1);
signal_f(1:32) = 1;

% Signal (g) - 32-point square impulse beginning at n = Ns > 0
Ns = 100; % Change this for different values of Ns
signal_g = zeros(1024, 1);
signal_g(Ns+1:Ns+32) = 1;

% Plotting signals
figure;

subplot(4, 2, 1);
plot(signal_a);
title('Signal (a) - Square impulse');

subplot(4, 2, 2);
plot(abs(fft(signal_a)));
title('Magnitude of FFT');

subplot(4, 2, 3);
plot(signal_b);
title('Signal (b) - Narrower square impulses');

subplot(4, 2, 4);
plot(abs(fft(signal_b)));
title('Magnitude of FFT');

subplot(4, 2, 5);
plot(signal_c);
title('Signal (c) - Sine wave (Integer periods)');

subplot(4, 2, 6);
plot(abs(fft(signal_c)));
title('Magnitude of FFT');

subplot(4, 2, 7);
plot(signal_d);
title('Signal (d) - Sine wave (Non-integer periods)');

subplot(4, 2, 8);
plot(abs(fft(signal_d)));
title('Magnitude of FFT');

% Counting zero crossings in FFT of signals (a) and (b)
zero_crossings_a = sum(diff(sign(abs(fft(signal_a)))) ~= 0);
zero_crossings_b = sum(diff(sign(abs(fft(signal_b)))) ~= 0);

fprintf('Number of zero crossings in FFT of signal (a): %d\n', zero_crossings_a);
fprintf('Number of zero crossings in FFT of signal (b): %d\n', zero_crossings_b);
% Number of zero crossings in FFT of signal (a): 1022
% Number of zero crossings in FFT of signal (b): 0

% Define parameters
fs = 1000; % Sampling frequency (Hz)
f = 50; % Frequency of the sine wave (Hz)
t = (0:511) / fs; % Time vector for 512 samples

% Generate sine wave with 512 samples
x_original = sin(2*pi*f*t);

% Plot spectrum of 512 samples
figure;
subplot(3, 1, 1);
plot(abs(fft(x_original)));
title('Spectrum of 512 samples of sine wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Zero-pad to 1024 samples
x_padded_1024 = [x_original, zeros(1, 512)];

% Plot spectrum of 1024 samples
subplot(3, 1, 2);
plot(abs(fft(x_padded_1024)));
title('Spectrum of 1024 zero-padded samples of sine wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Zero-pad to 2048 samples
x_padded_2048 = [x_original, zeros(1, 1024)];

% Plot spectrum of 2048 samples
subplot(3, 1, 3);
plot(abs(fft(x_padded_2048)));
title('Spectrum of 2048 zero-padded samples of sine wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Compute IFFT
x_reconstructed_1024 = ifft(fft(x_original, 1024));
x_reconstructed_2048 = ifft(fft(x_original, 2048));

% Plot real part of IFFT
figure;
subplot(2, 1, 1);
plot(real(x_original));
hold on;
plot(real(x_reconstructed_1024), '--');
title('Comparison between original and IFFT (1024 samples)');
legend('Original', 'IFFT (1024)');
xlabel('Samples');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(real(x_original));
hold on;
plot(real(x_reconstructed_2048), '--');
title('Comparison between original and IFFT (2048 samples)');
legend('Original', 'IFFT (2048)');
xlabel('Samples');
ylabel('Amplitude');



% Parameters
fs = 1000; % Sampling frequency (Hz)
N = 512; % Number of samples
f1 = 50; % Frequency of sine wave 1 (Hz)
f2 = 150; % Frequency of sine wave 2 (Hz)
A1 = 1; % Amplitude of sine wave 1
A2 = 0.5; % Amplitude of sine wave 2

% Generate sine waves
t = (0:N-1) / fs;
x1 = A1 * sin(2*pi*f1*t);
x2 = A2 * sin(2*pi*f2*t);
x_sum_similar = x1 + x2; % Sum of sinusoids with similar frequencies and amplitudes
x_sum_different = sin(2*pi*50*t) + sin(2*pi*200*t); % Sum of sinusoids with very different frequencies and amplitudes

% Plot spectrum of sine wave with rectangular window
figure;
subplot(3, 1, 1);
plot(abs(fft(x1)));
title('Spectrum of sine wave 1 (Rectangular window)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Apply different window shapes
window_types = {'rectwin', 'bartlett', 'hann', 'hamming', 'blackman'};
window_names = {'Rectangular', 'Bartlett', 'Hann', 'Hamming', 'Blackman'};
figure;

for i = 1:length(window_types)
    subplot(3, length(window_types), i);
    plot(abs(fft(x1 .* window(window_types{i}, N))));
    title(['Spectrum with ' window_names{i} ' window']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end

% Plot spectrum of sum of sinusoids with similar frequencies and amplitudes
subplot(3, 1, 2);
plot(abs(fft(x_sum_similar)));
title('Spectrum of sum of similar sinusoids');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot spectrum of sum of sinusoids with very different frequencies and amplitudes
subplot(3, 1, 3);
plot(abs(fft(x_sum_different)));
title('Spectrum of sum of different sinusoids');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% Parameters
fs = 1000; % Sampling frequency (Hz)
N = 512; % Number of samples
f = 50; % Frequency of sine wave (Hz)

% Generate sine wave
t = (0:N-1) / fs;
x = sin(2*pi*f*t);

% Apply Hamming window
x_windowed = x .* hamming(N);

% Perform FFT with boxcar (rectangular) window
X_boxcar = fft(x, N);

% Perform FFT with Hamming window
X_hamming = fft(x_windowed, N);

% Plot spectra
figure;
subplot(2, 1, 1);
plot(abs(X_boxcar));
title('Spectrum with Boxcar (Rectangular) Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2, 1, 2);
plot(abs(X_hamming));
title('Spectrum with Hamming Window');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
