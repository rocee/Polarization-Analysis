function varargout = BrainSectionMetadataEntry(varargin)
% BRAINSECTIONMETADATAENTRY MATLAB code for BrainSectionMetadataEntry.fig
%      BRAINSECTIONMETADATAENTRY, by itself, creates a new BRAINSECTIONMETADATAENTRY or raises the existing
%      singleton*.
%
%      H = BRAINSECTIONMETADATAENTRY returns the handle to a new BRAINSECTIONMETADATAENTRY or the handle to
%      the existing singleton*.
%
%      BRAINSECTIONMETADATAENTRY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRAINSECTIONMETADATAENTRY.M with the given input arguments.
%
%      BRAINSECTIONMETADATAENTRY('Property','Value',...) creates a new BRAINSECTIONMETADATAENTRY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BrainSectionMetadataEntry_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BrainSectionMetadataEntry_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BrainSectionMetadataEntry

% Last Modified by GUIDE v2.5 14-Mar-2016 15:34:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BrainSectionMetadataEntry_OpeningFcn, ...
                   'gui_OutputFcn',  @BrainSectionMetadataEntry_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BrainSectionMetadataEntry is made visible.
function BrainSectionMetadataEntry_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BrainSectionMetadataEntry (see VARARGIN)

% Choose default command line output for BrainSectionMetadataEntry
handles.output = hObject;

% **************************************************************************************************************************************************
% INPUT: (suggestedSampleNumber, existingSampleNumbers, suggestedSectionNumber, existingSectionNumbers, userName, importPath, isEdit, brainSection*)
%        *may be empty
% **************************************************************************************************************************************************

if isa(varargin{1},'numeric');
    handles.suggestedSampleNumber = num2str(varargin{1}); %Parameter name is 'suggestedSampleNumber' from Eye class function
else
    handles.suggestedSampleNumber = '';
end

handles.existingSampleNumbers = varargin{2};

if isa(varargin{3},'numeric');
    handles.suggestedBrainSectionNumber = num2str(varargin{3}); %Parameter name is 'suggestedBrainSectionNumber' from Brain Section class function
else
    handles.suggestedBrainSectionNumber = '';
end

handles.existingBrainSectionNumbers = varargin{4};
handles.userName = varargin{5};% Parameter name is 'userName'
handles.importPath = varargin{6};

isEdit = varargin{7};

brainSection = [];

if length(varargin) > 7
    brainSection = varargin{8};
end

if isempty(brainSection)
    brainSection = BrainSection;
end

handles.cancel = false;

if isEdit
    set(handles.OK, 'enable', 'on');
    
    set(handles.pathTitle, 'Visible', 'off');
    set(handles.importPathTitle, 'Visible', 'off');
    
    handles.sampleNumber = brainSection.sampleNumber;
    handles.brainSectionNumber = brainSection.brainSectionNumber;
    handles.source = brainSection.source;
    handles.sectionAnatomy = brainSection.sectionAnatomy;
    handles.storageLocation = brainSection.storageLocation;
    handles.notes = brainSection.notes;
    handles.timeOfRemoval = brainSection.timeOfRemoval;
    handles.timeOfProcessing = brainSection.timeOfProcessing;
    handles.dateReceived = brainSection.dateReceived;
    handles.initialFixative = brainSection.initialFixative;
    handles.initialFixativePercent = brainSection.initialFixativePercent;
    handles.initialFixingTime = brainSection.initialFixingTime;
    handles.secondaryFixative = brainSection.secondaryFixative;
    handles.secondaryFixativePercent = brainSection.secondaryFixativePercent;
    handles.secondaryFixingTime = brainSection.secondaryFixingTime;    
else
    defaultBrainSection = BrainSection;
    
    set(handles.OK, 'enable', 'off');
    
    set(handles.importPathDisplay, 'String', handles.importPath);   
    
    handles.sampleNumber = handles.suggestedSampleNumber;
    handles.brainSectionNumber = handles.suggestedBrainSectionNumber;
    handles.source = brainSection.source;
    handles.sectionAnatomy = defaultBrainSection.sectionAnatomy;
    handles.storageLocation = brainSection.storageLocation;
    handles.notes = defaultBrainSection.notes;
    handles.timeOfRemoval = brainSection.timeOfRemoval;
    handles.timeOfProcessing = brainSection.timeOfProcessing;
    handles.dateReceived = brainSection.dateReceived;
    handles.initialFixative = brainSection.initialFixative;
    handles.initialFixativePercent = brainSection.initialFixativePercent;
    handles.initialFixingTime = brainSection.initialFixingTime;
    handles.secondaryFixative = brainSection.secondaryFixative;
    handles.secondaryFixativePercent = brainSection.secondaryFixativePercent;
    handles.secondaryFixingTime = brainSection.secondaryFixingTime;  
end

% ** SET TEXT FIELDS **

set(handles.sampleNumberInput, 'String', num2str(handles.sampleNumber));
set(handles.brainSectionNumberInput, 'String', num2str(handles.brainSectionNumber));
set(handles.sectionAnatomyInput, 'String', handles.sectionAnatomyInput);
set(handles.storageLocationInput, 'String', handles.storageLocation);
set(handles.notesInput, 'String', handles.notes);
set(handles.initialFixativePercentInput, 'String', num2str(handles.initialFixativePercent));
set(handles.secondaryFixativePercentInput, 'String', num2str(handles.secondaryFixativePercent));

justDate = true;

setDateInput(handles.timeOfRemovalInput, handles.timeOfRemoval, ~justDate);
setDateInput(handles.timeOfProcessingInput, handles.timeOfProcessing, ~justDate);
setDateInput(handles.dateReceivedInput, handles.dateReceived, justDate);
setDateInput(handles.initialFixingTimeInput, handles.initialFixingTime, ~justDate);
setDateInput(handles.secondaryFixingTimeInput, handles.secondaryFixingTime, ~justDate);


% ** SET POP UP MENUS **

defaultString = 'Select a Sample Source';
[~, sourceChoiceStrings] = choicesFromEnum('TissueSampleSourceTypes');
selectedString = handles.source.displayString;
setPopUpMenu(handles.sourceSelect, defaultString, sourceChoiceStrings, selectedString)

defaultString = 'Select a Fixative';
[~, fixativeChoiceStrings] = choicesFromEnum('FixativeTypes');

selectedString = handles.initialFixative.displayString;
setPopUpMenu(handles.sourceSelect, defaultString, fixativeChoiceStrings, selectedString)

selectedString = handles.secondaryFixative.displayString;
setPopUpMenu(handles.sourceSelect, defaultString, fixativeChoiceStrings, selectedString)


guidata(hObject, handles);

% UIWAIT makes EyeMetadataEntry wait for user response (see UIRESUME)
uiwait(handles.EyeMetadataEntry);

% uiwait(handles.brainSectionMetadataEntry);


% --- Outputs from this function are returned to the command line.
function varargout = BrainSectionMetadataEntry_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%*******************************************************************************************************************************************************************************************************************
%OUTPUT: [cancel, sampleNumber, brainSectionNumber, source, timeOfRemoval, timeOfProcessing, dateReceived, storageLocation, anatomy, initFixative, initPercent, initTime, secondFixative, secondPercent, secondTime]
%*******************************************************************************************************************************************************************************************************************

varargout{1} = handles.cancel;
varargout{2} = handles.sampleNumber;
varargout{3} = handles.brainSectionNumber;
varargout{4} = handles.source;
varargout{5} = handles.timeOfRemoval;
varargout{6} = handles.timeOfProcessing;
varargout{7} = handles.dateReceived;
varargout{8} = handles.storageLocation;
varargout{9} = handles.sectionAnatomy;
varargout{10} = handles.initialFixative;
varargout{11} = handles.initialFixativePercent;
varargout{12} = handles.initialFixingTime;
varargout{13} = handles.secondaryFixative;
varargout{14} = handles.secondaryFixativePercent;
varargout{15} = handles.secondaryFixingTime;

close(handles.BrianSectionMetadataEntry);


function importPathDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to importPathDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of importPathDisplay as text
%        str2double(get(hObject,'String')) returns contents of importPathDisplay as a double


% --- Executes during object creation, after setting all properties.
function importPathDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to importPathDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampleNumberInput_Callback(hObject, eventdata, handles)
% hObject    handle to sampleNumberInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleNumberInput as text
%        str2double(get(hObject,'String')) returns contents of sampleNumberInput as a double


% --- Executes during object creation, after setting all properties.
function sampleNumberInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleNumberInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function brainSectionNumberInput_Callback(hObject, eventdata, handles)
% hObject    handle to brainSectionNumberInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brainSectionNumberInput as text
%        str2double(get(hObject,'String')) returns contents of brainSectionNumberInput as a double


% --- Executes during object creation, after setting all properties.
function brainSectionNumberInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brainSectionNumberInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sourceSelect.
function sourceSelect_Callback(hObject, eventdata, handles)
% hObject    handle to sourceSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sourceSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sourceSelect


% --- Executes during object creation, after setting all properties.
function sourceSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sourceSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in timeOfRemovalButton.
function timeOfRemovalButton_Callback(hObject, eventdata, handles)
% hObject    handle to timeOfRemovalButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function timeOfProcessingInput_Callback(hObject, eventdata, handles)
% hObject    handle to timeOfProcessingInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeOfProcessingInput as text
%        str2double(get(hObject,'String')) returns contents of timeOfProcessingInput as a double


% --- Executes during object creation, after setting all properties.
function timeOfProcessingInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeOfProcessingInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in timeOfProcessingButton.
function timeOfProcessingButton_Callback(hObject, eventdata, handles)
% hObject    handle to timeOfProcessingButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function dateReceivedInput_Callback(hObject, eventdata, handles)
% hObject    handle to dateReceivedInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dateReceivedInput as text
%        str2double(get(hObject,'String')) returns contents of dateReceivedInput as a double


% --- Executes during object creation, after setting all properties.
function dateReceivedInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dateReceivedInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dateReceivedButton.
function dateReceivedButton_Callback(hObject, eventdata, handles)
% hObject    handle to dateReceivedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function sectionAnatomyInput_Callback(hObject, eventdata, handles)
% hObject    handle to sectionAnatomyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sectionAnatomyInput as text
%        str2double(get(hObject,'String')) returns contents of sectionAnatomyInput as a double


% --- Executes during object creation, after setting all properties.
function sectionAnatomyInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sectionAnatomyInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function storageLocationInput_Callback(hObject, eventdata, handles)
% hObject    handle to storageLocationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of storageLocationInput as text
%        str2double(get(hObject,'String')) returns contents of storageLocationInput as a double


% --- Executes during object creation, after setting all properties.
function storageLocationInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to storageLocationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function notesInput_Callback(hObject, eventdata, handles)
% hObject    handle to notesInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of notesInput as text
%        str2double(get(hObject,'String')) returns contents of notesInput as a double


% --- Executes during object creation, after setting all properties.
function notesInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to notesInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cancelButton.
function cancelButton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in doneButton.
function doneButton_Callback(hObject, eventdata, handles)
% hObject    handle to doneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in initialFixativeSelect.
function initialFixativeSelect_Callback(hObject, eventdata, handles)
% hObject    handle to initialFixativeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns initialFixativeSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from initialFixativeSelect


% --- Executes during object creation, after setting all properties.
function initialFixativeSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialFixativeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialFixativePercentInput_Callback(hObject, eventdata, handles)
% hObject    handle to initialFixativePercentInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialFixativePercentInput as text
%        str2double(get(hObject,'String')) returns contents of initialFixativePercentInput as a double


% --- Executes during object creation, after setting all properties.
function initialFixativePercentInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialFixativePercentInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialFixingTimeInput_Callback(hObject, eventdata, handles)
% hObject    handle to initialFixingTimeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialFixingTimeInput as text
%        str2double(get(hObject,'String')) returns contents of initialFixingTimeInput as a double


% --- Executes during object creation, after setting all properties.
function initialFixingTimeInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialFixingTimeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in initialFixingTimeButton.
function initialFixingTimeButton_Callback(hObject, eventdata, handles)
% hObject    handle to initialFixingTimeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in secondaryFixativeSelect.
function secondaryFixativeSelect_Callback(hObject, eventdata, handles)
% hObject    handle to secondaryFixativeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns secondaryFixativeSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from secondaryFixativeSelect


% --- Executes during object creation, after setting all properties.
function secondaryFixativeSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secondaryFixativeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function secondaryFixativePercent_Callback(hObject, eventdata, handles)
% hObject    handle to secondaryFixativePercent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secondaryFixativePercent as text
%        str2double(get(hObject,'String')) returns contents of secondaryFixativePercent as a double


% --- Executes during object creation, after setting all properties.
function secondaryFixativePercent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secondaryFixativePercent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function secondaryFixingTimeInput_Callback(hObject, eventdata, handles)
% hObject    handle to secondaryFixingTimeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secondaryFixingTimeInput as text
%        str2double(get(hObject,'String')) returns contents of secondaryFixingTimeInput as a double


% --- Executes during object creation, after setting all properties.
function secondaryFixingTimeInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secondaryFixingTimeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in secondaryFixingTimeButton.
function secondaryFixingTimeButton_Callback(hObject, eventdata, handles)
% hObject    handle to secondaryFixingTimeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
