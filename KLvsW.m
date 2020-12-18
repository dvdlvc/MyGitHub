% %%
% % Interpolation of 1D Gaussians via OT
% 
% rep = 'results/gaussian-1d/';
% [~,~] = mkdir(rep);
% 
 N = 1024;
 x = linspace(0,1,N)';
 normalize = @(x)x/sum(x(:));
 gauss = @(m,s)normalize( exp( -(x-m).^2/(2*s^2) ) );
% 
 m0 = .1;  s0 = 0.025; %.025;
 m1 = .9;  s1 = 0.025; %.08;
% 
% 
q = 10;
% clf; hold on;
% for i=1:q
%     t = (i-1)/(q-1);
%     m = (1-t)*m0+t*m1;
%     s = (1-t)*s0+t*s1;
%     lw = 2;
%     plot(x, gauss(m,s), 'color', [1-t 0 t], 'LineWidth', lw);    
% end
% %set(gca, 'XTick', [], 'YTick', []);
% box on; axis tight;
% %saveas(gcf, [rep 'interp-density.eps']);
% 
% 
% for i=1:q
%     t(i) = (i-1)/(q-1);
%     m(i) = (1-t(i))*m0+t(i)*m1;
%     s(i) = (1-t(i))*s0+t(i)*s1;
%     lw = 2; 
% end
% 
% plot(m,s,'r+','LineWidth', lw)

%%
% plot geodesic on the Poincare half plane

% rep = '../results/kl-gaussian/';
% [~,~] = mkdir(rep);
% 
SetAR = @(ar)set(gca, 'PlotBoxAspectRatio', [1 ar 1], 'FontSize', 20);


%% Half Poincare

% Distance on Poincare space.

D = @(u,v)acosh(1 + abs(u-v).^2 ./ (2*imag(u).*imag(v))  );

u = 0 + .5i;

m = linspace(-1,1,200);
s = linspace(1e-3,2,200);
[S,M] = meshgrid(s,m);
V = M + 1i*S;

clf; hold on;
imagesc(m,s,D(u,V)');
contour(m,s,D(u,V)', 12, 'k');
colormap parula(256);
axis xy;



% Generate circle

r = 1000;
tmin = .1; tmax = .9;
t = linspace(tmin*pi,tmax*pi,r);
v = exp(1i*t);

% re-sample at equi-spacing
s = D(v(1),v);
s = s/s(end);
%q = q; % #intermediate points
ti = interp1(s, linspace(0,1,r), linspace(0,1,q));
ti = tmin + (tmax-tmin)*ti;
vi = exp(1i*pi*ti);

figure(1)
clf; hold on;
%plot( exp(1i*linspace(0,pi,r)) , 'k:');
plot(v, 'color', 'k', 'LineWidth', 2);
for i=1:q
    t = (i-1)/(q-1);
    col = [t 0 1-t];
    plot(vi(i), '.', 'MarkerSize', 45, 'MarkerEdgeColor', col);
end
axis equal; axis([-1 1 0 1]); 
axis off;
%saveas(gcf, 'geod-kl.eps', 'epsc');


figure(2)
t = linspace(0,1,r);
t1 = linspace(-.5,1.5,r);
clf; hold on;
plot( v(1)*t+v(end)*(1-t) , 'color', 'k', 'LineWidth', 2);
%plot( v(1)*t1+v(end)*(1-t1) , 'k:');
for i=1:q
    t = (i-1)/(q-1);
    col = [t 0 1-t];
    plot(v(1)*(1-t)+v(end)*t, '.', 'MarkerSize', 45, 'MarkerEdgeColor', col);
end
axis equal; axis([-1 1 0 1]); 
axis off;
%saveas(gcf, 'geod-ot.eps', 'epsc');


%%
% interpolations of densities. 

x = linspace(-3,3, 1024);
gauss = @(m,s)1/s * exp(-(x-m).^2/(2*s^2));

figure(3)
clf; hold on;
for i=1:q
    t = (i-1)/(q-1);
    vt = v(1)*(1-t)+v(end)*t;
    m = sqrt(2)*real(vt);
    s = imag(vt);
    col = [t 0 1-t];
    plot(x, gauss(m,s), 'Color', col, 'LineWidth', 2);
end
axis tight; axis off;
SetAR(1/2);
%saveas(gcf, 'densities-ot.eps', 'epsc');

figure(4)
clf; hold on;
for i=1:q
    t = (i-1)/(q-1);
    vt = v(1)*(1-t)+v(end)*t;
    m = sqrt(2)*real(vi(i));
    s = imag(vi(i));
    col = [t 0 1-t];
    plot(x, gauss(m,s), 'Color', col, 'LineWidth', 2);
end
axis tight; axis off;
SetAR(1/2);
%saveas(gcf,  'densities-kl.eps', 'epsc');


