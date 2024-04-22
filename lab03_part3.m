
y = LCPS_getdata(1024, 1, 1/48000);

spectrogram(y, hamming(100), 0.9*100, 100, 48000);
title('hamming(100)')

