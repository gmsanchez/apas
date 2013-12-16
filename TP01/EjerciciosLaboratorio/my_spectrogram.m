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
wl05c =  ceil(wlength/2);
wl05f = floor(wlength/2);
%x = [zeros(1,wlength) x zeros(1,wlength)];
w = window(fhandle,wlength)';
nw = floor(n/wspacing); % cantidad de ventanas que utilizo para 'ventanear'
specgram = ones(wl05f,nw+1);
s = 1;
for i=1:wspacing:n
    tmin = i-wl05c;
    tmax = i+wl05f-1;
    if tmin<1
        xloc = [zeros(1,-tmin+1) x(1:tmax)];
    elseif tmax>n
        xloc = [x(tmin:n) zeros(1,tmax-n)];
    else
        xloc = x(tmin:tmax);
    end
    xloc = xloc.*w;
    specloc = abs(fft(xloc));
    specgram(:,s) = specloc(1:wl05f);
    s = s+1;
end

colormap(jet)
taxis = linspace(0,ts*(n-1),1/ts);
deltaf = fs/wlength;
faxis = linspace(0,deltaf*wl05f,wl05f);
imagesc(taxis,faxis,specgram)
axis('xy')
xlabel('Time')
ylabel('Frequency')
   
end
