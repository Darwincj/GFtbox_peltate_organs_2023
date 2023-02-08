function [m,result] = gpt_nigellapetal_20230131( m, varargin )
%[m,result] = gpt_nigellapetal_20230131( m, varargin )
%   Morphogen interaction function.
%   Written at 2023-01-31 11:00:59.
%   GFtbox revision 20210716, 2020-07-16 20:00.

% The user may edit any part of this function lying between lines that
% begin "%%% USER CODE" and "%%% END OF USER CODE".  Those lines themselves
% delimiters themselves must not be moved, edited, deleted, or added.

    result = [];
    if isempty(m), return; end

    setGlobals();
    
    % Handle new-style callbacks.
    if nargin > 1
        if exist('ifCallbackHandler','file')==2
            [m,result] = ifCallbackHandler( m, varargin{:} );
        end
        return;
    end

    fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

    realtime = m.globalDynamicProps.currenttime;
    dt = m.globalProps.timestep;

%%% USER CODE: INITIALISATION
    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.

        if m.globalProps.IFsetsoptions
            m = setUpModelOptions( m, ...
                'modelname', {'MODEL1',...  % Fig 3C, S4B, Wildtype/Mock
                              'MODEL2',...  % Fig 3C, S4B, AD/AB removed at the beginning
                              'MODEL3',...  % Fig 3C, S4B, AD/AB removed at Phase I
                              'MODEL4',...  % Fig 3C, S4B, AD/AB removed at Phase II
                              'MODEL5',...  % Fig 3C, S4B, AD/AB removed at Phase III
                             }, 'MODEL4' ... % Model version name
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
        % setup latitudinal and longitudinal grid
        m = leaf_makesecondlayer( m, 'mode', 'latlong',...
                                     'hemisphere', 'n',...
                                     'subdivisions', 40,...
                                     'divisions', [16 8],...
                                     'add', true );
                                 
        % setup the arrow color of second polarity                          
        m = leaf_plotoptions( m, 'bioAalpha', 0, ...
                                 'highgradcolor2', [0.9, 0.1, 0.1],...
                                 'lowgradcolor2',[0.9, 0.1, 0.1],...
                                 'arrowthickness', 2 );
    end
    
    OPTIONS = getModelOptions( m );
    printModelOptions( m );
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

% Each call of getMgenLevels below returns four results:
% XXX_i is the index of the morphogen called XXX.
% XXX_p is the vector of all of its values.
% XXX_a is its mutation level.
% XXX_l is the "effective" level of the morphogen, i.e. XXX_p*XXX_a.
% In SECTION 3 of the automatically generated code, all of the XXX_p values
% will be copied back into the mesh.

    [kpar_i,kpar_p,kpar_a,kpar_l] = getMgenLevels( m, 'KPAR' );  %#ok<ASGLU>
    [kpar2_i,kpar2_p,kpar2_a,kpar2_l] = getMgenLevels( m, 'KPAR2' );  %#ok<ASGLU>
    [kper_i,kper_p,kper_a,kper_l] = getMgenLevels( m, 'KPER' );  %#ok<ASGLU>
    [pol_i,pol_p,pol_a,pol_l] = getMgenLevels( m, 'POL' );  %#ok<ASGLU>
    [pol2_i,pol2_p,pol2_a,pol2_l] = getMgenLevels( m, 'POL2' );  %#ok<ASGLU>
    [id_adaxial_i,id_adaxial_p,id_adaxial_a,id_adaxial_l] = getMgenLevels( m, 'ID_ADAXIAL' );  %#ok<ASGLU>
    [id_abaxial_i,id_abaxial_p,id_abaxial_a,id_abaxial_l] = getMgenLevels( m, 'ID_ABAXIAL' );  %#ok<ASGLU>
    [id_midplane_i,id_midplane_p,id_midplane_a,id_midplane_l] = getMgenLevels( m, 'ID_MIDPLANE' );  %#ok<ASGLU>
    [id_prox_i,id_prox_p,id_prox_a,id_prox_l] = getMgenLevels( m, 'ID_PROX' );  %#ok<ASGLU>
    [id_tip_i,id_tip_p,id_tip_a,id_tip_l] = getMgenLevels( m, 'ID_TIP' );  %#ok<ASGLU>
    [id_stalk_i,id_stalk_p,id_stalk_a,id_stalk_l] = getMgenLevels( m, 'ID_STALK' );  %#ok<ASGLU>
    [s_adaxial_i,s_adaxial_p,s_adaxial_a,s_adaxial_l] = getMgenLevels( m, 'S_ADAXIAL' );  %#ok<ASGLU>
    [s_abaxial_i,s_abaxial_p,s_abaxial_a,s_abaxial_l] = getMgenLevels( m, 'S_ABAXIAL' );  %#ok<ASGLU>
    [id_sinus_i,id_sinus_p,id_sinus_a,id_sinus_l] = getMgenLevels( m, 'ID_SINUS' );  %#ok<ASGLU>
    [id_surface_i,id_surface_p,id_surface_a,id_surface_l] = getMgenLevels( m, 'ID_SURFACE' );  %#ok<ASGLU>
    [v_center_i,v_center_p,v_center_a,v_center_l] = getMgenLevels( m, 'V_CENTER' );  %#ok<ASGLU>
    [v_tip_i,v_tip_p,v_tip_a,v_tip_l] = getMgenLevels( m, 'V_TIP' );  %#ok<ASGLU>
    [id_switch1_i,id_switch1_p,id_switch1_a,id_switch1_l] = getMgenLevels( m, 'ID_SWITCH1' );  %#ok<ASGLU>
    [id_tip2_i,id_tip2_p,id_tip2_a,id_tip2_l] = getMgenLevels( m, 'ID_TIP2' );  %#ok<ASGLU>
    [id_switch2_i,id_switch2_p,id_switch2_a,id_switch2_l] = getMgenLevels( m, 'ID_SWITCH2' );  %#ok<ASGLU>
    [id_adaxial2_i,id_adaxial2_p,id_adaxial2_a,id_adaxial2_l] = getMgenLevels( m, 'ID_ADAXIAL2' );  %#ok<ASGLU>
    [id_abaxial2_i,id_abaxial2_p,id_abaxial2_a,id_abaxial2_l] = getMgenLevels( m, 'ID_ABAXIAL2' );  %#ok<ASGLU>
    [id_midplane2_i,id_midplane2_p,id_midplane2_a,id_midplane2_l] = getMgenLevels( m, 'ID_MIDPLANE2' );  %#ok<ASGLU>
    [id_surface2_i,id_surface2_p,id_surface2_a,id_surface2_l] = getMgenLevels( m, 'ID_SURFACE2' );  %#ok<ASGLU>
    [s_adaxial2_i,s_adaxial2_p,s_adaxial2_a,s_adaxial2_l] = getMgenLevels( m, 'S_ADAXIAL2' );  %#ok<ASGLU>
    [s_abaxial2_i,s_abaxial2_p,s_abaxial2_a,s_abaxial2_l] = getMgenLevels( m, 'S_ABAXIAL2' );  %#ok<ASGLU>
    [s_lip_i,s_lip_p,s_lip_a,s_lip_l] = getMgenLevels( m, 'S_LIP' );  %#ok<ASGLU>
    [v_radii1_i,v_radii1_p,v_radii1_a,v_radii1_l] = getMgenLevels( m, 'V_RADII1' );  %#ok<ASGLU>
    [v_radii2_i,v_radii2_p,v_radii2_a,v_radii2_l] = getMgenLevels( m, 'V_RADII2' );  %#ok<ASGLU>
    [id_mid_ven_i,id_mid_ven_p,id_mid_ven_a,id_mid_ven_l] = getMgenLevels( m, 'ID_MID_VEN' );  %#ok<ASGLU>
    [id_mid_dor_i,id_mid_dor_p,id_mid_dor_a,id_mid_dor_l] = getMgenLevels( m, 'ID_MID_DOR' );  %#ok<ASGLU>
    [s_mid_ven_i,s_mid_ven_p,s_mid_ven_a,s_mid_ven_l] = getMgenLevels( m, 'S_MID_VEN' );  %#ok<ASGLU>
    [s_mid_dor_i,s_mid_dor_p,s_mid_dor_a,s_mid_dor_l] = getMgenLevels( m, 'S_MID_DOR' );  %#ok<ASGLU>
    [id_core_i,id_core_p,id_core_a,id_core_l] = getMgenLevels( m, 'ID_CORE' );  %#ok<ASGLU>
    [id_fold_i,id_fold_p,id_fold_a,id_fold_l] = getMgenLevels( m, 'ID_FOLD' );  %#ok<ASGLU>
    [id_blade_i,id_blade_p,id_blade_a,id_blade_l] = getMgenLevels( m, 'ID_BLADE' );  %#ok<ASGLU>
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_bottom_i,id_bottom_p,id_bottom_a,id_bottom_l] = getMgenLevels( m, 'ID_BOTTOM' );  %#ok<ASGLU>

% Mesh type: volumetric

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                 KPAR         ----    ----       ----     ----
%                KPAR2         ----    ----       ----     ----
%                 KPER         ----    ----       ----     ----
%                  POL          0.1    0.01       ----     ----
%                 POL2          0.1    0.01       ----     ----
%           ID_ADAXIAL         ----    ----       ----     ----
%           ID_ABAXIAL         ----    ----       ----     ----
%          ID_MIDPLANE         ----    ----       ----     ----
%              ID_PROX         ----    ----       ----     ----
%               ID_TIP         ----    ----       ----     ----
%             ID_STALK         ----    ----       ----     ----
%            S_ADAXIAL         0.05    0.01       ----     ----
%            S_ABAXIAL         0.05    0.01       ----     ----
%             ID_SINUS         ----    ----       ----     ----
%           ID_SURFACE         ----    ----       ----     ----
%             V_CENTER         ----    ----       ----     ----
%                V_TIP         ----    ----       ----     ----
%           ID_SWITCH1         ----    ----       ----     ----
%              ID_TIP2         ----    ----       ----     ----
%           ID_SWITCH2         ----    ----       ----     ----
%          ID_ADAXIAL2         ----    ----       ----     ----
%          ID_ABAXIAL2         ----    ----       ----     ----
%         ID_MIDPLANE2         ----    ----       ----     ----
%          ID_SURFACE2         ----    ----       ----     ----
%           S_ADAXIAL2         0.05    0.01       ----     ----
%           S_ABAXIAL2         0.05    0.01       ----     ----
%                S_LIP         0.01    ----       ----     ----
%             V_RADII1         ----    ----       ----     ----
%             V_RADII2         ----    ----       ----     ----
%           ID_MID_VEN         ----    ----       ----     ----
%           ID_MID_DOR         ----    ----       ----     ----
%            S_MID_VEN         0.02   0.001       ----     ----
%            S_MID_DOR         0.01   0.001       ----     ----
%              ID_CORE         ----    ----       ----     ----
%              ID_FOLD         ----    ----       ----     ----
%             ID_BLADE         ----    ----       ----     ----
%              ID_BASE         ----    ----       ----     ----
%            ID_BOTTOM         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.
        
        % AD/AB patterning at the first beginning
        switch OPTIONS.modelname
        
            case 'MODEL2'
                
                % Removal of AD 
                id_adaxial_p(:) = 0;  % factor AD
                id_abaxial_p(:) = 1;  % factor AB 
                
%                 % Removal of AB
%                 id_adaxial_p(:) = 1;  % factor AD
%                 id_abaxial_p(:) = 0;  % factor AB 
                
            otherwise
                
                id_adaxial_p( m.FEnodes(:,1) < 0 ) = 1;  % factor AD 
                id_abaxial_p( m.FEnodes(:,1) > 0 ) = 1;  % factor AB
                
        end
        
        
        
        s_abaxial_p = id_abaxial_p;
        m.morphogenclamp((id_abaxial_p == 1), s_abaxial_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_ABAXIAL', 0.05 );      % diffusion constant of S_ABAXIAL
        m = leaf_mgen_absorption( m, 'S_ABAXIAL', 0.01 );        % decay rate of S_ABAXIAL
        
        s_adaxial_p = id_adaxial_p;
        m.morphogenclamp((id_adaxial_p == 1), s_adaxial_i ) = 1;
        m = leaf_mgen_conductivity( m, 'S_ADAXIAL', 0.05 );      % diffusion constant of S_ADAXIAL
        m = leaf_mgen_absorption( m, 'S_ADAXIAL', 0.01 );        % decay rate of S_ADAXIAL 
        
        id_midplane_p((s_adaxial_p < 0.8) & (s_abaxial_p < 0.8)) = 1;  % factor MIP
        
        % Surface of the primordium
        RADII_CENTER = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2 + m.FEnodes(:,3).^2);
        id_surface_p((RADII_CENTER > 0.95) & (~id_midplane_p)) = 1;  % factor SURF
        
        % Central core of the primordium
        RADII_CORE = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2);
        id_core_p((RADII_CORE<=0.05)&(~id_adaxial_p)) = 1;  % factor CORE
        
        % For repatterning
        id_adaxial2_p((m.FEnodes(:,1)<0)&((m.FEnodes(:,3)*2+m.FEnodes(:,1))>0.75))=1;
        id_abaxial2_p((m.FEnodes(:,1)>0)|((m.FEnodes(:,3)*2+m.FEnodes(:,1))<0.45))=1;
        
        s_abaxial2_p = id_abaxial2_p;
        m.morphogenclamp((id_abaxial2_p == 1), s_abaxial2_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_ABAXIAL2', 0.05 );      % diffusion constant of S_ABAXIAL
        m = leaf_mgen_absorption( m, 'S_ABAXIAL2', 0.01 );        % decay rate of S_ABAXIAL
        
        s_adaxial2_p = id_adaxial2_p;
        m.morphogenclamp((id_adaxial2_p == 1), s_adaxial2_i ) = 1;
        m = leaf_mgen_conductivity( m, 'S_ADAXIAL2', 0.05 );      % diffusion constant of S_ADAXIAL
        m = leaf_mgen_absorption( m, 'S_ADAXIAL2', 0.01 );        % decay rate of S_ADAXIAL

        id_midplane2_p((s_adaxial2_p < 0.8) & (s_abaxial2_p < 0.8)) = 1;
        id_surface2_p((RADII_CENTER > 0.95) & (~id_midplane2_p)) = 1;

        tip = [ 0, 0, 1 ];
        RADII_TIP = sqrt((m.FEnodes(:,1) - tip(1)).^2 +...
                         (m.FEnodes(:,2) - tip(2)).^2 +...
                         (m.FEnodes(:,3) - tip(3)).^2);
        id_base_p( m.FEnodes(:,3) == min(m.FEnodes(:,3)) ) = 1;  % factor BASE  
        id_tip_p((abs(m.FEnodes(:,1)) < 0.01) &...
                  (abs(m.FEnodes(:,2)) < 0.9 ) &...
                  (RADII_CENTER > 0.95)) = 1;
        id_tip_p = id_tip_p & id_midplane_p;  % factor TIP
        
        id_tip2_p((RADII_CENTER > 0.95) &...
                   (abs(m.FEnodes(:,2)) < 0.6) &...   % change from 0.01 to 0.6 
                   (m.FEnodes(:,1) < 0)) = 1;
        id_tip2_p = id_tip2_p & id_midplane2_p;   
        
        s_lip_p = id_tip2_p;
        m.morphogenclamp((id_tip2_p == 1), s_lip_i ) = 1;
        m = leaf_mgen_conductivity( m, 'S_LIP', 0.01 );  
        
        id_sinus_p(RADII_TIP < 0.2) = 1;  % factor SINUS
        
%         % NOT USE
%         id_fold_p((abs(m.FEnodes(:,1)-0.21)<0.06)&(m.FEnodes(:,3)>0.5))=1;
        % factor MID_VEN and MID_DOR
        id_mid_ven_p((abs(m.FEnodes(:,2))<0.05)&(m.FEnodes(:,1)<-0.5)&(m.FEnodes(:,3) > 0.28))=1;
        s_mid_ven_p = id_mid_ven_p;
        m.morphogenclamp((id_mid_ven_p == 1), s_mid_ven_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_MID_VEN', 0.02 );      
        m = leaf_mgen_absorption( m, 'S_MID_VEN', 0.001 );  
        
        id_mid_dor_p(((abs(m.FEnodes(:,2)+0.4)<0.05)|(abs(m.FEnodes(:,2)-0.4))<0.05)&...
                     (m.FEnodes(:,1)<0.6)&(m.FEnodes(:,1)>-0.2)&(m.FEnodes(:,3) > 0.28))=1;
        
        s_mid_dor_p = id_mid_dor_p;
        m.morphogenclamp((id_mid_dor_p == 1), s_mid_dor_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_MID_DOR', 0.01 );      
        m = leaf_mgen_absorption( m, 'S_MID_DOR', 0.001 ); 
        
        % along with the repatterning of adaxial domain
        % alternative stalk domain [0.38, 0.48, 0.58, 0.68, 0.78]
        id_stalk_p(m.FEnodes(:,3) < 0.28) = 1;   % factor STK
        id_blade_p(m.FEnodes(:,3) > 0.28) = 1;  % factor BLA
        
        id_bottom_p(m.FEnodes(:,3) < 0.2) = 1;
              
        m = leaf_fix_vertex( m, 'vertex', find(m.FEnodes(:,3) == min(m.FEnodes(:,3))), 'dfs', 'z');
        
    end
    
    % @@ PRN Polarity Regulatory Network
    % Pre-growth stage for generating the polarity fields  
    % The orthoplanar polarity field was established by a diffusible morphogen POL
    % generated by a source and removed at a sink    
    % The proximodistal polarity field was established by a diffusible morphogen POL2
    % generated by a source and removed at a sink
    
    % @@ KRN Growth Rate Regulatory Network
    % kpar: growth rate paralle to the orthoplanar polarity field (Kop in the text)
    % kpar2: growth rate paralle to the proximodistal polarity field (Kpd in the text)
    % kper: growth rate perpendicular to both polarity fields (Kper in the text)
    
    if (realtime <= 3 - 0.0001)
        
        m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial', 'id_midplane' });
        m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial', 'id_midplane' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );
                
        pol_p=0;
        pol2_p = -m.FEnodes(:,3);
        
        kpar_p = 0;
        kper_p = 0;
        kpar2_p = 0.5 * id_bottom_p;   % for generating an elongated base part for primordium
                
    end
    
    switch OPTIONS.modelname

        case 'MODEL1'  % Wildtype/Mock

            % Pre-patterning
            if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial', 'id_midplane' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial', 'id_midplane' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );
                
               pol_p = id_surface_p - id_midplane_p - id_core_p; 
               m.morphogenclamp((id_surface_p == 1)|(id_midplane_p == 1)|(id_core_p == 1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL
        
               pol2_p = id_base_p - id_tip_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar_p = 0;
               kper_p = 0;
               kpar2_p = 0;

            end
            
            % Growth Phase I   
            if (realtime > 4 - 0.001) && (realtime <= 8 - 0.001)

               kpar2_p = 0.2;
               kpar_p = 0.001;
               kper_p = 0.2 * inh(10,id_stalk_p);

            end
             
            % Shift of AD/AB domains and polarities, no growth
            if (realtime > 8 - 0.001) && (realtime <= 9 - 0.001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' });
               m = leaf_plotpriority( m, { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );

               pol_p = id_surface2_p - id_midplane2_p - id_core_p;
               m.morphogenclamp((id_surface2_p==1)|(id_midplane2_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL

               pol2_p = id_base_p - id_tip_p - id_tip2_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1)|(id_tip2_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            % Growth Phase II
            if (realtime > 9 - 0.001) && (realtime <= 12 - 0.001)

               kpar2_p = 0.2 * pro(0.5,s_mid_ven_p).* pro(0.8,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(2,id_stalk_p);

            end
    
            % Growth Phase III
            if (realtime > 12 - 0.001) && (realtime <= 20 - 0.001)
               
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial2', 'id_abaxial2', 'id_midplane2', 'id_sinus' });
               m = leaf_plotpriority( m, { 'id_adaxial2', 'id_abaxial2', 'id_midplane2', 'id_sinus' },...
                                  [ 1, 1, 2, 3 ], [ 0.5, 0.5, 0.5, 0.5 ], 'type', 'morphogen' );

               kpar2_p = 0.2 * inh(10,id_sinus_p).*pro(1.0,s_mid_ven_p).* pro(1.2,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(10,id_sinus_p) .* inh(2,id_stalk_p);
 
            end

            
        case 'MODEL2'  % AD/AB was removed at the beginning
            
            if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
                
               pol_p = id_surface_p - id_midplane_p - id_core_p;
               m.morphogenclamp((id_surface_p == 1)|(id_midplane_p == 1)|(id_core_p == 1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );  
               m = leaf_mgen_absorption( m, 'POL', 0.01 );  
        
               pol2_p = id_base_p - id_tip_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 ); 
               m = leaf_mgen_absorption( m, 'POL2', 0.01 ); 
        
               kpar_p = 0;
               kper_p = 0;
               kpar2_p = 0;

            end
            
            % Growth Phase I-III
            if (realtime > 4 - 0.001) && (realtime <= 20 - 0.001)

               kpar2_p = 0.2;
               kpar_p = 0.001;
               kper_p = 0.05;
        
            end

            
        case 'MODEL3'  % AD/AB was removed at Phase I
            
            if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
                
               pol_p = id_surface_p - id_midplane_p - id_core_p; 
               m.morphogenclamp((id_surface_p == 1)|(id_midplane_p == 1)|(id_core_p == 1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );
               m = leaf_mgen_absorption( m, 'POL', 0.01 );     
        
               pol2_p = id_base_p - id_tip_p;   
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );        
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );       
        
               kpar_p = 0;
               kper_p = 0;
               kpar2_p = 0;

            end
             
            % Growth Phase I 
            if (realtime > 4 - 0.001) && (realtime <= 8 - 0.001)

               kpar2_p = 0.2;
               kpar_p = 0.001;
               kper_p = 0.2 * inh(10,id_stalk_p);

            end
    
            % AD/AB was removed and the polarities were redistributed, no growth
            if (realtime > 8 - 0.001) && (realtime <= 9 - 0.001)
        
               % Removal of AD 
               id_adaxial_p(:) = 0; 
               id_abaxial_p(:) = 1;
               
%                % Removal of AB 
%                id_adaxial_p(:) = 1; 
%                id_abaxial_p(:) = 0;
               
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial' },...
                                  [ 1, 1 ], [ 0.5, 0.5 ], 'type', 'morphogen' );

               pol_p = 0;
               pol_p = id_surface_p - id_core_p; 
               m.morphogenclamp((id_surface_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 ); 
               m = leaf_mgen_absorption( m, 'POL', 0.01 );  
% 
%                pol2_p = id_base_p - id_tip_p;  
%                m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
%                m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         
%                m = leaf_mgen_absorption( m, 'POL2', 0.01 ); 
        
               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            % Growth Phase II-III
            if (realtime > 9 - 0.001) && (realtime <= 20 - 0.001)

               kpar2_p = 0.2 * pro(0.3,id_blade_p) .* pro(0.3,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(2,id_stalk_p);
 
            end
 
        case 'MODEL4'  % AD/AB removed at Phase II
            
            % Pre-patterning
            if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial', 'id_midplane' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial', 'id_midplane' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );
                
               pol_p = id_surface_p - id_midplane_p - id_core_p; 
               m.morphogenclamp((id_surface_p == 1)|(id_midplane_p == 1)|(id_core_p == 1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL
        
               pol2_p = id_base_p - id_tip_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar_p = 0;
               kper_p = 0;
               kpar2_p = 0;

            end
            
            % Growth Phase I   
            if (realtime > 4 - 0.001) && (realtime <= 8 - 0.001)

               kpar2_p = 0.2;
               kpar_p = 0.001;
               kper_p = 0.2 * inh(10,id_stalk_p);

            end
             
            % Shift of AD/AB domains and polarities, no growth
            if (realtime > 8 - 0.001) && (realtime <= 9 - 0.001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' });
               m = leaf_plotpriority( m, { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );

               pol_p = id_surface2_p - id_midplane2_p - id_core_p;
               m.morphogenclamp((id_surface2_p==1)|(id_midplane2_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL

               pol2_p = id_base_p - id_tip_p - id_tip2_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1)|(id_tip2_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            % Growth Phase II
            if (realtime > 9 - 0.001) && (realtime <= 12 - 0.001)

               kpar2_p = 0.2 * pro(0.5,s_mid_ven_p).* pro(0.8,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(2,id_stalk_p);

            end
            
            % AD/AB was removed and the polarities were redistributed, no growth
            if (realtime > 12 - 0.001) && (realtime <= 13 - 0.001)
                
                % Removal of AD 
               id_adaxial_p(:) = 0; 
               id_abaxial_p(:) = 1;
               
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial' },...
                                  [ 1, 1 ], [ 0.5, 0.5 ], 'type', 'morphogen' );
               
%                % Removal of AB 
%                id_adaxial_p(:) = 1; 
%                id_abaxial_p(:) = 0;
        
               pol_p = 0;
               pol_p = id_surface2_p - id_core_p;   
               m.morphogenclamp((id_surface2_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );   
               m = leaf_mgen_absorption( m, 'POL', 0.01 );     

               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            % Growth Phase III
            if (realtime > 13 - 0.001) && (realtime <= 20 - 0.001)

               kpar2_p = 0.2 * pro(0.1,id_blade_p) .* pro(0.3,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(2,id_stalk_p);

            end
            

        case 'MODEL5'  % AD/AB removed at Phase III
            
            % Pre-patterning
            if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial', 'id_midplane' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial', 'id_midplane' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );
                
               pol_p = id_surface_p - id_midplane_p - id_core_p; 
               m.morphogenclamp((id_surface_p == 1)|(id_midplane_p == 1)|(id_core_p == 1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL
        
               pol2_p = id_base_p - id_tip_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar_p = 0;
               kper_p = 0;
               kpar2_p = 0;

            end
            
            % Growth Phase I   
            if (realtime > 4 - 0.001) && (realtime <= 8 - 0.001)

               kpar2_p = 0.2;
               kpar_p = 0.001;
               kper_p = 0.2 * inh(10,id_stalk_p);

            end
             
            % Shift of AD/AB domains and polarities, no growth
            if (realtime > 8 - 0.001) && (realtime <= 9 - 0.001)
        
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' });
               m = leaf_plotpriority( m, { 'id_adaxial2', 'id_abaxial2', 'id_midplane2' },...
                                  [ 1, 1, 2 ], [ 0.5, 0.5, 0.5 ], 'type', 'morphogen' );

               pol_p = id_surface2_p - id_midplane2_p - id_core_p;
               m.morphogenclamp((id_surface2_p==1)|(id_midplane2_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
               m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL

               pol2_p = id_base_p - id_tip_p - id_tip2_p;
               m.morphogenclamp((id_base_p == 1)|(id_tip_p == 1)|(id_tip2_p == 1), pol2_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
               m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
        
               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            % Growth Phase II
            if (realtime > 9 - 0.001) && (realtime <= 12 - 0.001)

               kpar2_p = 0.2 * pro(0.5,s_mid_ven_p).* pro(0.8,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(2,id_stalk_p);

            end
    
            % Growth Phase III
            if (realtime > 12 - 0.001) && (realtime <= 16 - 0.001)

               kpar2_p = 0.2 * inh(10,id_sinus_p).*pro(1.0,s_mid_ven_p).* pro(1.2,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(10,id_sinus_p) .* inh(2,id_stalk_p);
 
            end
            
            % AD/AB was removed and the polarities were redistributed, no growth
            if (realtime > 16 - 0.001) && (realtime <= 17 - 0.001)
                
                % Removal of AD 
               id_adaxial_p(:) = 0; 
               id_abaxial_p(:) = 1;
               
               m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial', 'id_abaxial' });
               m = leaf_plotpriority( m, { 'id_adaxial', 'id_abaxial' },...
                                  [ 1, 1 ], [ 0.5, 0.5 ], 'type', 'morphogen' );
               
%                % Removal of AB 
%                id_adaxial_p(:) = 1; 
%                id_abaxial_p(:) = 0;
        
               pol_p = 0;
               pol_p = id_surface2_p - id_core_p;   
               m.morphogenclamp((id_surface2_p==1)|(id_core_p==1), pol_i) = 1;
               m = leaf_mgen_conductivity( m, 'POL', 0.1 );   
               m = leaf_mgen_absorption( m, 'POL', 0.01 );     

               kpar2_p = 0;
               kpar_p = 0;
               kper_p = 0;
        
            end
            
            if (realtime > 17 - 0.001) && (realtime <= 20 - 0.001)

               kpar2_p = 0.2 * inh(10,id_sinus_p).*pro(1.0,s_mid_ven_p).* pro(1.2,s_mid_dor_p).*pro(0.1,id_stalk_p);
               kpar_p = 0.01;
               kper_p = 0.15 * inh(10,id_sinus_p) .* inh(2,id_stalk_p);

            end 

    end
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

    m.morphogens(:,kpar_i) = kpar_p;
    m.morphogens(:,kpar2_i) = kpar2_p;
    m.morphogens(:,kper_i) = kper_p;
    m.morphogens(:,pol_i) = pol_p;
    m.morphogens(:,pol2_i) = pol2_p;
    m.morphogens(:,id_adaxial_i) = id_adaxial_p;
    m.morphogens(:,id_abaxial_i) = id_abaxial_p;
    m.morphogens(:,id_midplane_i) = id_midplane_p;
    m.morphogens(:,id_prox_i) = id_prox_p;
    m.morphogens(:,id_tip_i) = id_tip_p;
    m.morphogens(:,id_stalk_i) = id_stalk_p;
    m.morphogens(:,s_adaxial_i) = s_adaxial_p;
    m.morphogens(:,s_abaxial_i) = s_abaxial_p;
    m.morphogens(:,id_sinus_i) = id_sinus_p;
    m.morphogens(:,id_surface_i) = id_surface_p;
    m.morphogens(:,v_center_i) = v_center_p;
    m.morphogens(:,v_tip_i) = v_tip_p;
    m.morphogens(:,id_switch1_i) = id_switch1_p;
    m.morphogens(:,id_tip2_i) = id_tip2_p;
    m.morphogens(:,id_switch2_i) = id_switch2_p;
    m.morphogens(:,id_adaxial2_i) = id_adaxial2_p;
    m.morphogens(:,id_abaxial2_i) = id_abaxial2_p;
    m.morphogens(:,id_midplane2_i) = id_midplane2_p;
    m.morphogens(:,id_surface2_i) = id_surface2_p;
    m.morphogens(:,s_adaxial2_i) = s_adaxial2_p;
    m.morphogens(:,s_abaxial2_i) = s_abaxial2_p;
    m.morphogens(:,s_lip_i) = s_lip_p;
    m.morphogens(:,v_radii1_i) = v_radii1_p;
    m.morphogens(:,v_radii2_i) = v_radii2_p;
    m.morphogens(:,id_mid_ven_i) = id_mid_ven_p;
    m.morphogens(:,id_mid_dor_i) = id_mid_dor_p;
    m.morphogens(:,s_mid_ven_i) = s_mid_ven_p;
    m.morphogens(:,s_mid_dor_i) = s_mid_dor_p;
    m.morphogens(:,id_core_i) = id_core_p;
    m.morphogens(:,id_fold_i) = id_fold_p;
    m.morphogens(:,id_blade_i) = id_blade_p;
    m.morphogens(:,id_base_i) = id_base_p;
    m.morphogens(:,id_bottom_i) = id_bottom_p;

%%% USER CODE: FINALISATION

% In this section you may modify the mesh in any way whatsoever.
%%% END OF USER CODE: FINALISATION

end

function [m,result] = ifCallbackHandler( m, fn, varargin )
    result = [];
    if exist(fn,'file') ~= 2
        return;
    end
    [m,result] = feval( fn, m, varargin{:} );
end


%%% USER CODE: SUBFUNCTIONS

% Here you may write any functions of your own, that you want to call from
% the interaction function, but never need to call from outside it.
% Remember that they do not have access to any variables except those
% that you pass as parameters, and cannot change anything except by
% returning new values as results.
% Whichever section they are called from, they must respect the same
% restrictions on what modifications they are allowed to make to the mesh.

% The GFtbox_..._Callback routines can be deleted if you do not use them.
% Those that you retain will be automatically called by GFtbox at certain
% points in the simulation cycle.
% If you retain them, their headers specifying their arguments and results
% must not be altered.

function [m,result] = GFtbox_Precelldivision_Callback( m, ci ) %#ok<DEFNU>
    result = [];
    % Your code here.

    % If a nonempty result is to be returned, it should be a struct
    % with fields result.divide, result.dividepoint, and result.perpendicular.
end

function [m,result] = GFtbox_Postcelldivision_Callback( m, ci, cei, newci, newcei, oe1, oe2, ne1, ne2, ne3 ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postiterate_Callback( m ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Preplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

