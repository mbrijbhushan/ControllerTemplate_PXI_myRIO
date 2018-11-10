close('all');

s=tf('s');
Ts = 0.0005 ; %Sample time in seconds

tau = 6.2e-3 ; %RC time constant of low pass filter in ms

sys =  1/(tau*s+1); %Continuous time, laplace transfer function

sysD = c2d(sys, Ts, 'zoh'); %Discrete time transfer function

% h = bodeplot(sysD);
% setoptions(h,'FreqUnits','Hz','MagUnits','abs','MagScale','log','Grid','on')

[mag,phase,wout] = bode(sysD); % units are abs, deg, rad/s
phase = squeeze(phase);
mag = squeeze(mag);
wout = wout/(2*pi); % convert rad/s to Hz


figure(2)

subplot(2,1,1)
%Load RCckt.txt as array into MATLAB
f=RCckt(:,1);
m=RCckt(:,2);
p=RCckt(:,3);
loglog(f,m,'.',wout,mag)
xlim([1 1000])
ylabel('Magnitude (abs)')
grid('on')

subplot(2,1,2)
semilogx(f,p,'.',wout,phase)
xlim([1 1000])
xlabel('Frequency (Hz)')
ylabel('Phase (deg)')
grid('on')
