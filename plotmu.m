figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData1 = plot(mu, meanJ1);hold on;
set(hData1, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel1 = xlabel('\mu');
hYLabel1 = ylabel('Mean of leader cost, E[J_1]');

set([hXLabel1, hYLabel1], 'FontSize', 14);
% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)


set(gcf,'PaperPositionMode','auto');
print -depsc2 mumeanJ1.eps
%%

figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData2 = plot(mu, varJ1);hold on;
set(hData2, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel2 = xlabel('\mu');
hYLabel2 = ylabel('Variance of leader cost, Var[J_1]');

set([hXLabel2, hYLabel2], 'FontSize', 14);
% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

set(gcf,'PaperPositionMode','auto');
print -depsc2 muvarJ1.eps

%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData3 = plot(mu, meanJ2);hold on;
set(hData3, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel3 = xlabel('\mu');
hYLabel3 = ylabel('E[J_2]');
set([hXLabel3, hYLabel3], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

set(gcf,'PaperPositionMode','auto');
print -depsc2 mumeanJ2.eps

%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData4 = plot(mu, varJ2);hold on;
set(hData4, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel4 = xlabel('\mu');
hYLabel4 = ylabel('Var[J_2]');
set([hXLabel4, hYLabel4], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

set(gcf,'PaperPositionMode','auto');
print -depsc2 muvarJ2.eps

%% Average and variance of state values
meanxtraj1 = cellfun(@mean,xtraj1,'UniformOutput',false);
varxtraj1  = cellfun(@var, xtraj1,'UniformOutput',false);
meanstate1 = cellfun(@(x) x(1), meanxtraj1(1,:));
meanstate2 = cellfun(@(x) x(2), meanxtraj1(1,:));
varstate1 = cellfun(@(x) x(1), varxtraj1(1,:));
varstate2 = cellfun(@(x) x(2), varxtraj1(1,:));
%% 
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData5 = plot(mu, meanstate1);hold on;
set(hData5, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel5 = xlabel('\mu');
hYLabel5 = ylabel('Mean of State x_1');
set([hXLabel5, hYLabel5], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

% set(gcf,'PaperPositionMode','auto');
% print -depsc2 muvmeanstate1.eps

%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData6 = plot(mu, varstate1);hold on;
set(hData6, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel6 = xlabel('\mu');
hYLabel6 = ylabel('Variance of State x_1');
set([hXLabel6, hYLabel6], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

% set(gcf,'PaperPositionMode','auto');
% print -depsc2 muvmeanstate1.eps

%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData7 = plot(mu, meanstate2);hold on;
set(hData7, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel7 = xlabel('\mu');
hYLabel7 = ylabel('Mean of State x_2');
set([hXLabel7, hYLabel7], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

% set(gcf,'PaperPositionMode','auto');
% print -depsc2 muvmeanstate1.eps
%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData8 = plot(mu, varstate2);hold on;
set(hData8, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2,...
    'Marker','o', 'MarkerSize', 8);hold on;
hXLabel8 = xlabel('\mu');
hYLabel8 = ylabel('Variance of State x_2');
set([hXLabel8, hYLabel8], 'FontSize', 14)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

% set(gcf,'PaperPositionMode','auto');
% print -depsc2 muvmeanstate1.eps