function varargout = SensitivityAndSpecificityModule(varargin)
% SENSITIVITYANDSPECIFICITYMODULE MATLAB code for SensitivityAndSpecificityModule.fig
%      SENSITIVITYANDSPECIFICITYMODULE, by itself, creates a new SENSITIVITYANDSPECIFICITYMODULE or raises the existing
%      singleton*.
%
%      H = SENSITIVITYANDSPECIFICITYMODULE returns the handle to a new SENSITIVITYANDSPECIFICITYMODULE or the handle to
%      the existing singleton*.
%
%      SENSITIVITYANDSPECIFICITYMODULE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SENSITIVITYANDSPECIFICITYMODULE.M with the given input arguments.
%
%      SENSITIVITYANDSPECIFICITYMODULE('Property','Value',...) creates a new SENSITIVITYANDSPECIFICITYMODULE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SensitivityAndSpecificityModule_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SensitivityAndSpecificityModule_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SensitivityAndSpecificityModule

% Last Modified by GUIDE v2.5 15-Jul-2016 10:23:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SensitivityAndSpecificityModule_OpeningFcn, ...
                   'gui_OutputFcn',  @SensitivityAndSpecificityModule_OutputFcn, ...
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

% --- Executes when user attempts to close SensitivityAndSpecificityModule.
function SensitivityAndSpecificityModule_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to SensitivityAndSpecificityModule (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.cancel = true;
guidata(hObject, handles);

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    
    uiresume(hObject);
else
    % The GUI is no longer waiting, just close it
    
    delete(hObject);
end


% --- Executes just before SensitivityAndSpecificityModule is made visible.
function SensitivityAndSpecificityModule_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SensitivityAndSpecificityModule (see VARARGIN)

% ***************************************
% INPUT: (project, projectPath, username)
% ***************************************

handles.project = varargin{1};
handles.projectPath = varargin{2};
handles.userName = varargin{3};

handles.rejected = false;
handles.rejectedReason = '';
handles.rejectedBy = handles.userName;

handles.skipRejectedSessions = true;

handles.cancel = false;

% ** SET REJECTED INPUTS **

handles = setRejectedInputFields(handles);


% SET LOCATION SELECT

selectedTrial = handles.project.getSelectedTrial();

handles.selectedTrial = selectedTrial;

[hasValidLocation, selectStructure] = selectedTrial.createSelectStructure(class(SensitivityAndSpecificityAnalysisSession));


if hasValidLocation
    [selectStrings, selectValues] = getSelectStringsAndValues(selectStructure);
else
    selectStrings = {'No Valid Locations for Selected Trial'};
    selectValues = [];
end

set(handles.sessionSelectListbox, 'String', selectStrings, 'Value', selectValues);

handles.selectStructure = selectStructure;


% SET EXCLUSION REASON STRINGS

exclusionReasons = getExclusionReasons(selectStructure);

set(handles.exclusionReasonListbox, 'String', exclusionReasons, 'Value', []);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SensitivityAndSpecificityModule wait for user response (see UIRESUME)
uiwait(handles.SensitivityAndSpecificityModule);


% --- Outputs from this function are returned to the command line.
function varargout = SensitivityAndSpecificityModule_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% *************************
% OUTPUT: [cancel, project]
% *************************

varargout{1} = handles.cancel;
varargout{2} = handles.project;

close(handles.SensitivityAndSpecificityModule);


function rejectedReasonInput_Callback(hObject, eventdata, handles)
% hObject    handle to rejectedReasonInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rejectedReasonInput as text
%        str2double(get(hObject,'String')) returns contents of rejectedReasonInput as a double


% --- Executes during object creation, after setting all properties.
function rejectedReasonInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rejectedReasonInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rejectedByInput_Callback(hObject, eventdata, handles)
% hObject    handle to rejectedByInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rejectedByInput as text
%        str2double(get(hObject,'String')) returns contents of rejectedByInput as a double


% --- Executes during object creation, after setting all properties.
function rejectedByInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rejectedByInput (see GCBO)
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

exit = questdlg('Are you sure you want to quit?','Quit','Yes','No','No'); 
switch exit
    case 'Yes'
        %Clears variables in the case that they wish to exit the program
        handles.cancel = true;
        
        guidata(hObject, handles);
        
        uiresume(handles.SensitivityAndSpecificityModule);
    case 'No'
end

% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

project = handles.project;

analysisReason = get(handles.analysisReasonInput, 'String');
analysisTitle = get(handles.analysisTitleInput, 'String');
notes = get(handles.notesInput, 'String');

rejected = get(handles.yesRejectedButton, 'Value');

if rejected
    rejectedReason = get(handles.rejectedReasonInput, 'String');
    rejectedBy = get(handles.rejectedByInput, 'String');
else
    rejectedReason = '';
    rejectedBy = '';
end

trial = performSensitivityAndSpecificity(...
    handles.selectedTrial,...
    handles.selectStructure,...
    handles.userName,...
    analysisReason,...
    analysisTitle,...
    notes,...
    rejected,...
    rejectedReason,...
    rejectedBy);

project = project.updateTrial(trial);

handles.project = project;

guidata(hObject, handles);
uiresume(handles.SensitivityAndSpecificityModule);


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


% --- Executes on button press in skipRejectedSessionsCheckbox.
function skipRejectedSessionsCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to skipRejectedSessionsCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of skipRejectedSessionsCheckbox


% --- Executes on selection change in sessionSelectListbox.
function sessionSelectListbox_Callback(hObject, eventdata, handles)
% hObject    handle to sessionSelectListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sessionSelectListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sessionSelectListbox

selectStructure = handles.selectStructure;

clickedIndex = get(hObject, 'Value');

if length(clickedIndex) == 1
            
    % update select structure      
    
    selectStructure = updateLocationSelectStructureForSensitivityAndSpecificityModule(selectStructure, clickedIndex);
    
    % update highlighting
    [~, selectValues] = getSelectStringsAndValues(selectStructure);
    
    set(handles.sessionSelectListbox, 'Value', selectValues);
    
    %update exclusionReasons
    exclusionReasons = getExclusionReasons(selectStructure);
    
    set(handles.exclusionReasonListbox, 'String', exclusionReasons, 'Value', []);
    
    % push to handles
    handles.selectStructure = selectStructure;
    
    guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function sessionSelectListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sessionSelectListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in yesRejectedButton.
function yesRejectedButton_Callback(hObject, eventdata, handles)
% hObject    handle to yesRejectedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yesRejectedButton



% --- Executes on button press in noRejectedButton.
function noRejectedButton_Callback(hObject, eventdata, handles)
% hObject    handle to noRejectedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noRejectedButton



% --- Executes on button press in deselectAllButton.
function deselectAllButton_Callback(hObject, eventdata, handles)
% hObject    handle to deselectAllButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selectStructure = handles.selectStructure;

selected = false;

selectStructure = selectOrDeselectAll(selectStructure, selected);

% update highlighting
[~, selectValues] = getSelectStringsAndValues(selectStructure);

set(handles.sessionSelectListbox, 'Value', selectValues);


% push to handles
handles.selectStructure = selectStructure;

guidata(hObject, handles);


% --- Executes on button press in selectAllButton.
function selectAllButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectAllButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selectStructure = handles.selectStructure;

selected = true;

selectStructure = selectOrDeselectAll(selectStructure, selected);

% update highlighting
[~, selectValues] = getSelectStringsAndValues(selectStructure);

set(handles.sessionSelectListbox, 'Value', selectValues);

% update exclusion reasons
exclusionReasons = getExclusionReasons(selectStructure);

set(handles.exclusionReasonListbox, 'String', exclusionReasons, 'Value', []);


% push to handles
handles.selectStructure = selectStructure;

guidata(hObject, handles);

% --- Executes when selected object is changed in rejectedButtonGroup.
function rejectedButtonGroup_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in rejectedButtonGroup 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

if eventdata.NewValue == handles.yesRejectedButton
    handles.rejected = true;
    handles.rejectedBy = handles.userName;
    
    set(handles.rejectedReasonInput, 'enable', 'on');
    set(handles.rejectedByInput, 'enable', 'on');
    set(handles.rejectedByInput, 'String', handles.userName);
else
    set(handles.rejectedReasonInput, 'enable', 'off');
    set(handles.rejectedReasonInput, 'String', '');
    set(handles.rejectedByInput, 'enable', 'off');
    set(handles.rejectedByInput, 'String', '');
    
    handles.rejectedReason = '';
    handles.rejectedBy = '';
    
    handles.rejected = false;
end
guidata(hObject, handles);

guidata(hObject, handles);





% --- Executes on selection change in analysisTypeListbox.
function analysisTypeListbox_Callback(hObject, eventdata, handles)
% hObject    handle to analysisTypeListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns analysisTypeListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from analysisTypeListbox


% --- Executes during object creation, after setting all properties.
function analysisTypeListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysisTypeListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function analysisReasonInput_Callback(hObject, eventdata, handles)
% hObject    handle to analysisReasonInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of analysisReasonInput as text
%        str2double(get(hObject,'String')) returns contents of analysisReasonInput as a double


% --- Executes during object creation, after setting all properties.
function analysisReasonInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysisReasonInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function analysisTitleInput_Callback(hObject, eventdata, handles)
% hObject    handle to analysisTitleInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of analysisTitleInput as text
%        str2double(get(hObject,'String')) returns contents of analysisTitleInput as a double


% --- Executes during object creation, after setting all properties.
function analysisTitleInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysisTitleInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in exclusionReasonListbox.
function exclusionReasonListbox_Callback(hObject, eventdata, handles)
% hObject    handle to exclusionReasonListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns exclusionReasonListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from exclusionReasonListbox


% --- Executes during object creation, after setting all properties.
function exclusionReasonListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exclusionReasonListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in syncScrollbarsButton.
function syncScrollbarsButton_Callback(hObject, eventdata, handles)
% hObject    handle to syncScrollbarsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

listboxTop = get(handles.sessionSelectListbox, 'ListboxTop');

set(handles.exclusionReasonListbox, 'ListboxTop', listboxTop);

guidata(hObject, handles);
