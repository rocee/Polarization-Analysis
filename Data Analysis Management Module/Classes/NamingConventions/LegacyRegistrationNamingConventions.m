classdef LegacyRegistrationNamingConventions
    % LegacyRegistrationNamingConventions
    % naming constants for legacy registration
    
    properties (Constant)       
        % directories
        SESSION_DIR_SUBTITLE = 'Legacy Registration';
        
        MM_DIR = NamingConvention({''}, {'MM'}); % the import directory is not divided into subdirectory, but in the project database, let's subdivide it
        
        % image series
        MM_IMAGES_PSA = {NamingConvention({'45'}, {'45'}), NamingConvention({'00'}, {'00'}), NamingConvention({'30'}, {'30'}), NamingConvention({'60'}, {'60'})};
        MM_IMAGES_PSG = {NamingConvention({'45'}, {'45'}), NamingConvention({'00'}, {'00'}), NamingConvention({'30'}, {'30'}), NamingConvention({'60'}, {'60'})};        
        
        % image filename suffixes        
        MM_FILENAME_LABEL = 'MM';
                
    end
    
    methods (Static)
        
        function namingConventions = getMMNamingConventions()
            namingConventions = {};
            counter = 1;
            
            for i=1:length(LegacyRegistrationNamingConventions.MM_IMAGES_PSG)
                for j=1:length(LegacyRegistrationNamingConventions.MM_IMAGES_PSA)
                    import = strcat(LegacyRegistrationNamingConventions.MM_IMAGES_PSG{i}.import{1}, LegacyRegistrationNamingConventions.MM_IMAGES_PSA{j}.import{1});
                    project = {LegacyRegistrationNamingConventions.MM_IMAGES_PSG{i}.getSingularProjectTag(), LegacyRegistrationNamingConventions.MM_IMAGES_PSA{j}.getSingularProjectTag()};
                    
                    namingConventions{counter} = NamingConvention({import}, project);
                    counter = counter + 1;
                end
            end
        end
        
        
    end
    
end

