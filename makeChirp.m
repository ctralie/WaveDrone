Fs = 44100;
f = linspace(440, 440*8, Fs*3);
t = 1:Fs*3;
y = sin(2*pi*f.*t/Fs);
h = zeros(1, Fs*3);
h(1) = 1;
h(round(Fs/4)) = 0.1;
h(round(Fs/3)) = 0.01;
h(round(Fs/2)) = 0.02;
y = conv(h, y);

N = 1024;
S = spectrogram(y, N);
N = size(S, 1)*2-1;
freq = linspace(0, Fs*N/(N+1), N);
freq = freq(1:size(S, 1));
time = (1:length(y))/Fs;
imagesc(time, freq, log(abs(S)));
ylim([0, 8000]);
xlabel('Time (sec)');
ylabel('Freq (hz)');

sound(y, Fs);