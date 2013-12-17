function [ specgram ] = my_spectrogram( x, wtype, ...
                        wlength, noverlap, fs, matlabstyle)

if nargin<6
    matlabstyle = 0;
end

switch wtype
    case 0
        fhandle = @rectwin;
        % disp('Rectangular Window');
    case 1
        fhandle = @hann;
        % disp('Hanning Window');
    case 2
        fhandle = @hamming;
        % disp('Hamming Window');
    case 3
        fhandle = @gausswin;
        % disp('Gaussian Window');
    otherwise
        fhandle = @hann;
        % disp('Switching to default: Hanning Window');
end

n = length(x);
%inc_t = floor(n/wnumber);
wnumber = floor(n/wlength);
w = window(fhandle,wlength+2*noverlap)';
wl = length(w);
% fprintf('Tamaño de ventana: %d\n',wl);
wl05c = ceil(0.5*wl);
wl05f = floor(0.5*wl);
specgram = zeros(wl05f,wnumber);
s = 1;
for i=1:wlength:n
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
    specloc = (abs(fft(xloc)));
    specgram(:,s) = specloc(1:wl05f);
    s = s+1;
end

taxis = 0:wlength/fs:n/fs-wlength/fs;
deltaf = fs/wl;
faxis = linspace(0,deltaf*wl05f,wl05f);
if matlabstyle
    specgram = specgram';
    imagesc(faxis,taxis,specgram);
    axis('xy')
    ylabel('Time')
    xlabel('Frequency')
else
    imagesc(taxis,faxis,specgram);
    axis('xy')
    xlabel('Time')
    ylabel('Frequency')
end
colormap(jet)
end
