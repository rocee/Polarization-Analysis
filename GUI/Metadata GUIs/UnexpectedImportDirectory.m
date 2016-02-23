function varargout = UnexpectedImportDirectory(varargin)
% UNEXPECTEDIMPORTDIRECTORY MATLAB code for UnexpectedImportDirectory.fig
%      UNEXPECTEDIMPORTDIRECTORY, by itself, creates a new UNEXPECTEDIMPORTDIRECTORY or raises the existing
%      singleton*.
%
%      H = UNEXPECTEDIMPORTDIRECTORY returns the handle to a new UNEXPECTEDIMPORTDIRECTORY or the handle to
%      the existing singleton*.
%
%      UNEXPECTEDIMPORTDIRECTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNEXPECTEDIMPORTDIRECTORY.M with the given input arguments.
%
%      UNEXPECTEDIMPORTDIRECTORY('Property','Value',...) creates a new UNEXPECTEDIMPORTDIRECTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UnexpectedImportDirectory_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UnexpectedImportDirectory_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UnexpectedImportDirectory

% Last Modified by GUIDE v2.5 18-Feb-2016 16:08:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UnexpectedImportDirectory_OpeningFcn, ...
                   'gui_OutputFcn',  @UnexpectedImportDirectory_OutputFcn, ...
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


% --- Executes just before UnexpectedImportDirectory is made visible.
function UnexpectedImportDirectory_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UnexpectedImportDirectory (see VARARGIN)

% ****************************************************************************************************
% INPUT: (importPath, filenames, suggestedDirectoryName, suggestedDirectoryTag, suggestedFilenameTags)
% ****************************************************************************************************

handles.importPath = varargin{1};
handles.filenames = varargin{2};

handles.folderName = varargin{3};
handles.directoryTag = varargin{4};
handles.filenameTags = varargin{5};

handles.cancel = false;

set(handles.importPathText, 'String', handles.importPath);
set(handles.importFilenames, 'String', handles.filenames);

set(handles.folderNameInput, 'String', handles.folderName);
set(handles.tagInput, 'String', handles.directoryTag);
set(handles.filenameTagsInput, 'String', handles.filenameTags);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UnexpectedImportDirectory wait for user response (see UIRESUME)
uiwait(handles.UnexpectedImportDirectory);


% --- Outputs from this function are returned to the command line.
function varargout = UnexpectedImportDirectory_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ***********************************************************
% OUTPUT: [cancel, directoryName, directoryTag, filenameTags]
% ***********************************************************

% Get default command line output from handles structure
varargout{1} = handles.cancel;
varargout{2} = handles.folderName;
varargout{3} = handles.directoryTag;
varargout{4} = handles.filenameTags;


close(handles.UnexpectedImportDirectory);



function importPathText_Callback(hObject, eventdata, handles)
% hObject    handle to importPathText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of importPathText as text
%        str2double(get(hObject,'String')) returns contents of importPathText as a double

set(handles.importPathText, 'String', handles.importPath);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function importPathText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to importPathText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function folderNameInput_Callback(hObject, eventdata, handles)
% hObject    handle to folderNameInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of folderNameInput as text
%        str2double(get(hObject,'String')) returns contents of folderNameInput as a double


% --- Executes during object creation, after setting all properties.
function folderNameInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to folderNameInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function importFilenames_Callback(hObject, eventdata, handles)
% hObject    handle to importFilenames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of importFilenames as text
%        str2double(get(hObject,'String')) returns contents of importFilenames as a double


% --- Executes during object creation, after setting all properties.
function importFilenames_CreateFcn(hObject, eventdata, handles)
% hObject    handle to importFilenames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function filenameTagsInput_Callback(hObject, eventdata, handles)
% hObject    handle to filenameTagsInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filenameTagsInput as text
%        str2double(get(hObject,'String')) returns contents of filenameTagsInput as a double


% --- Executes during object creation, after setting all properties.
function filenameTagsInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filenameTagsInput (see GCBO)
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
        
        handles.folderName = '';
        handles.directoryTag = '';
        handles.filenameTags = {};
        
        guidata(hObject, handles);
        uiresume(handles.UnexpectedImportDirectory);
    case 'No'
end


% --- Executes on button press in doneButton.
function doneButton_Callback(hObject, eventdata, handles)
% hObject    handle to doneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.folderName = get(handles.folderNameInput, 'String');
handles.directoryTag = get(handles.tagInput, 'String');
handles.filenameTags = get(handles.filenameTagsInput, 'String');

guidata(hObject, handles);
uiresume(handles.UnexpectedImportDirectory);

% --- Executes when user attempts to close UnexpectedImportDirectory.
function UnexpectedImportDirectory_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to UnexpectedImportDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.cancel = true;
handles.folderName = '';
handles.directoryTag = '';
handles.filenameTags = {};

guidata(hObject, handles);

if isequal(get(hObject, 'waitstatus'), 'waiting')
    uiresume(hObject);
else
    delete(hObject);
end




function tagInput_Callback(hObject, eventdata, handles)
% hObject    handle to tagInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tagInput as text
%        str2double(get(hObject,'String')) returns contents of tagInput as a double


% --- Executes during object creation, after setting all properties.
function tagInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end