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
LCPS(x);
title('Amplitude Spectrum of Signal x');
