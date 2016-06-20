function statsOutput = runStats(dataForStats, dataLocationStrings, dataSessionStrings, comparisonType)
% runStats

metricTypes = enumeration('MetricTypes');

statTypes = enumeration('StatisticTypes');

colHeaders = comparisonType.columnHeaders;

statsOutput = {};

template = {};

[template] = setColumnHeaders(template, metricTypes, colHeaders);
[template] = setRowLabels(template, dataLocationStrings, dataSessionStrings);

for i=1:length(statTypes)
    statType = statTypes(i);
    
    statTypeOutput = template;
    
    % prep data: format is cell array for each metric where each index
    % contains non-cell array with columns for pos, neg, etc, and rows for
    % each location
    
    data = prepData(dataForStats, metricTypes, statType);
    
    statTypeOutput = placeData(statTypeOutput, data);
    
    
    
    statsOutput{i} = statTypeOutput;
    
end

end


% ****************
% HELPER FUNCTIONS
% ****************


% setColumnHeaders

function output = setColumnHeaders(output, metricTypes, colHeaders)

rowLabelHeaders = {'Location', 'Sessions'};
numRowLabelHeaders = length(rowLabelHeaders);

numColHeaders = length(colHeaders);

i = 1;

while i <= numRowLabelHeaders
    output{1,i} = rowLabelHeaders{i};
    
    i = i+1;
end

for j=1:length(metricTypes)
    metricType = metricTypes(j);
    
    metricLabels = metricType.getMetricLabels();
    
    for k=1:length(metricLabels)
        label = metricLabels{k};
        
        output{1,i} = label; % set top headers
        
        for l=1:numColHeaders
            output{2,i+l-1} = colHeaders{l}; %set sub headers
        end
        
        i = i + numColHeaders;
    end
    
end

end

% setRowLabels

function output = setRowLabels(output, dataLocationStrings, dataSessionStrings)

headerOffset = 2; %two rows from header and sub headers

for i=1:length(dataLocationStrings)
    output{i + headerOffset, 1} = dataLocationStrings{i};
    output{i + headerOffset, 2} = dataSessionStrings{i};
end

end


% prep data

function preppedData = prepData(data, metricTypes, statFile)

preppedData = {};

numLocations = length(data);

metricCounter = 1;

subPreppedMetricData = [];

for i=1:length(metricTypes)
    metricType = metricTypes(i);
    
    useCircStats = metricType.getUseCircStats();
    
    numStats = length(useCircStats);
    
    preppedMetricData = cell(numStats,1);
    
    for j=1:numLocations
        locationData = data{j};
        
        numCols = length(locationData);
        
        k = 1;
        
        while k <= numCols
            colLocationData = locationData{k};
            
            metricData = colLocationData{i};
            
            for l=1:numStats
                subPreppedMetricData(j,k) = prepMetricData(metricData, useCircStats{l}, statFile);
                
                preppedMetricData{l} = subPreppedMetricData;
                
                k = k + 1;
            end
        end
    end
    
    for l=1:numStats
        preppedData{metricCounter} = preppedMetricData{l};
        metricCounter = metricCounter + 1;
    end
end
end


% prepMetricData
function preppedData = prepMetricData(metricData, useCircStats, statType)

dims = size(metricData);

metricData = reshape(metricData, dims(1)*dims(2), 1);

switch statType
    case StatisticTypes.mean
        if useCircStats
            preppedData = mean(metricData);
        else
            preppedData = circ_mean(metricData);
        end
        
    case StatisticTypes.median
        if useCircStats
            preppedData = median(metricData);
        else
            preppedData = median(metricData); %can't do circ_median, way too resource intensive
        end
        
    case StatisticTypes.stdev
        if useCircStats
            preppedData = std(metricData);
        else
            preppedData = circ_std(metricData);
        end
        
    case StatisticTypes.skewness
        if useCircStats
            preppedData = skewness(metricData);
        else
            preppedData = circ_skewness(metricData);
        end
end

end

% place data
function output = placeData(output, data)
%first find starting points to start placeing the data
dims = size(output);

endRow = dims(1);

spacerColIndex = 0;

for i=1:dims(1)
    if isempty(output{endRow,i});
        spacerColIndex = i;
        break;
    end
end

spacerRowIndex = 0;

for i=1:dims(1)
    if isempty(output{i,spacerColIndex});
        spacerRowIndex = i;
        break;
    end
end

for i=1:length(data)
    dataFromMetric = data{i};
    
    dims = size(dataFromMetric);
    
    rowIndex = spacerRowIndex;
    
    for j=1:dims(1)
        
        colIndex = spacerColIndex;
        
        for k=1:dims(2)
            output{rowIndex, colIndex} = dataFromMetric(j,k);
            
            colIndex = colIndex + 1;
        end
        
        rowIndex = rowIndex + 1;
    end
    
    spacerColIndex = spacerColIndex + dims(2);
end


end


