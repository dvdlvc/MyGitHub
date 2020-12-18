%% Code for Figure 2
% this is adapted from Peyre and Cuturi (2019)
%addpath('/Users/davidelavecchia/Downloads/optimaltransport.github.io-master/toolbox/');

SetAR = @(ar)set(gca, 'PlotBoxAspectRatio', [1 ar 1]);
SetTickOff = @()set(gca, 'XTick',[], 'YTick',[]);
SetTickOn = @()set(gca, 'XTick',[0 1/2 1], 'YTick',[0 1/2 1]);

rep = 'results/1d-cumulative/';
[~,~] = mkdir(rep);

N = 256;
t = linspace(0,1,N)';
gauss = @(m,s)exp(-(t-m).^2/(2*s).^2);
normalize = @(x)x/sum(x(:));

s = .3;
a = gauss(.3*s,.05*s) + .5*gauss(.6*s,.15*s);
b = .5*gauss(1-s*.2,.04*s) + 1*gauss(1-s*.5,.05*s) + .5*gauss(1-s*.8,.04*s);
vmin = .025;
a = normalize(vmin + a);
b = normalize(vmin + b);

plot(t,[a b]);

clf;
area(t, a, 'FaceColor', 'r');
axis tight; SetAR(1/2); SetTickOff();
saveas(gca, [rep 'mu.eps'], 'epsc');

clf;
area(t, b, 'FaceColor', 'b');
axis tight; SetAR(1/2); SetTickOff();
saveas(gca, [rep 'nu.eps'], 'epsc');

% cumulative
ca = cumsum(a);
cb = cumsum(b);
% inverse cumulatives
ica = interp1(ca, t, t, 'spline');
icb = interp1(cb, t, t, 'spline');
% composition of function
Tab = interp1(t, icb, ca, 'spline'); % icb o ca
Tba = interp1(t, ica, cb, 'spline'); % ica o cb
% should be close to Id
Iaa = interp1(t, Tba, Tab, 'spline'); % Tba o Tab
Ibb = interp1(t, Tab, Tba, 'spline'); % Tab o Tba

lw = 2;
clf; hold on;
plot(t, Tab, '--','color','black', 'LineWidth', lw);
axis tight; box on; %SetTickOn();  SetAR(1);
set(gca, 'FontSize', 20);
xlabel('x');ylabel('T(x)')
saveas(gca, [rep 'transport.eps'], 'epsc');


% Barycenter of inverse cumulant`
q = 9;
m = {}; icm = {}; cm = {};
for i=1:q
    r = (i-1)/(q-1);
    icm{i} = (1-r)*ica + r*icb;
    cm{i} = interp1(icm{i}, t, t, 'spline');
    m{i} = diff([0;cm{i}]);
end

% display interpolation of inverse cumulant
clf; hold on;
for i=1:q
    r = (i-1)/(q-1);
    col = [1-r 0 r];
    plot(t, icm{i}, 'color', col, 'LineWidth', lw);
end
axis tight; SetAR(1); SetTickOn(); box on;
set(gca, 'FontSize', 20);
saveas(gca, [rep 'interp-cumul.eps'], 'epsc');

% display inverpolation of measures
clf; hold on;
for i=1:q
    r = (i-1)/(q-1);
    col = [1-r 0 r];
    plot(t, m{i}, 'color', col, 'LineWidth', lw);
end
axis tight; SetAR(1/2); SetTickOff(); box on;
set(gca, 'FontSize', 20);
saveas(gca, [rep 'bary.eps'], 'epsc');






