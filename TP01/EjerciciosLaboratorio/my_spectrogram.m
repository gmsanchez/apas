function [ specgram ] = my_spectrogram( x, wtype, wlength, wspacing , fs)

switch wtype
    case 0
        fhandle = @rectwin;
        disp('Rectangular Window');
    case 1
        fhandle = @hann;
        disp('Hanning Window');
    case 2
        fhandle = @hamming;
        disp('Hamming Window');
    case 3
        fhandle = @gausswin;
        disp('Gaussian Window');
    otherwise
        fhandle = @hann;
        disp('Switching to default: Hanning Window');
end

ts = 1/fs;
n = length(x);
wl05 = floor(wlength/2);
x = [zeros(1,wlength) x zeros(1,wlength)];
w = window(fhandle,wlength)';
specgram = zeros(wl05,n);
nw = floor(n/wspacing); % cantidad de ventanas que utilizo para 'ventanear'

for i=1:1:nw
    t = wlength + 1 + (i-1)*wspacing;
    tmin = t-ceil(wlength/2);
    tmax = tmin+wlength-1;
    xloc = x(tmin:tmax).*w;
    specloc = abs(fft(xloc));
    specgram(:,t-wlength) = specloc(1:wl05);
end

colormap(jet)
taxis = linspace(0,ts*(n-1),1/ts);
deltaf = fs/wlength;
faxis = linspace(0,deltaf*wl05,wl05);
imagesc(taxis,faxis,specgram)
axis('xy')
xlabel('Time')
ylabel('Frequency')
   
end

