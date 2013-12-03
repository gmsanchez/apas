function [ specgram ] = my_spectrogram( x, wtype, wlength, wspacing )

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

n = length(x);
wl05 = floor(wlength/2);
x = [zeros(1,wlength) x zeros(1,wlength)];
w = window(fhandle,wlength)';
%specgram = zeros(w+1,n);
nw = floor(n/wspacing) % cantidad de ventanas que utilizo para 'ventanear'

for i=1:1:nw
    t = wlength + 1 + (i-1)*wspacing
    tmin = t-ceil(wlength/2)
    tmax = tmin+wlength-1
    xloc = x(tmin:tmax).*w;
    specloc = abs(fft(xloc));
    specgram(:,t) = specloc(1:wl05);
end

colormap(jet)
imagesc(specgram)
axis('xy')
xlabel('Time')
ylabel('Frequency')
   
end

