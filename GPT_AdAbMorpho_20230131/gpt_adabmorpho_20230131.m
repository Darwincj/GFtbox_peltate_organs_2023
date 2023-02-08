function [m,result] = gpt_adabmorpho_20230131( m, varargin )
%[m,result] = gpt_adabmorpho_20230131( m, varargin )
%   Morphogen interaction function.
%   Written at 2023-02-01 14:39:59.
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
                'modelname', {'MODEL1',...  % Fig 4, S10
                              'MODEL2',...  % 
                             }, 'MODEL1' ... % Model version name
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
        m = leaf_makesecondlayer( m, 'mode', 'latlong',...
                                     'hemisphere', 'n',...
                                     'subdivisions', 40,...
                                     'divisions', [16 8],...
                                     'add', true );
                                 
        m = leaf_plotoptions( m, 'bioAalpha', 0, ...
                                 'highgradcolor2', [0.9, 0.1, 0.1],...
                                 'lowgradcolor2',[0.9, 0.1, 0.1],...
                                 'arrowthickness', 3 );
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
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_tip_i,id_tip_p,id_tip_a,id_tip_l] = getMgenLevels( m, 'ID_TIP' );  %#ok<ASGLU>
    [id_bottom_i,id_bottom_p,id_bottom_a,id_bottom_l] = getMgenLevels( m, 'ID_BOTTOM' );  %#ok<ASGLU>
    [s_adaxial_i,s_adaxial_p,s_adaxial_a,s_adaxial_l] = getMgenLevels( m, 'S_ADAXIAL' );  %#ok<ASGLU>
    [s_abaxial_i,s_abaxial_p,s_abaxial_a,s_abaxial_l] = getMgenLevels( m, 'S_ABAXIAL' );  %#ok<ASGLU>
    [id_sinus_i,id_sinus_p,id_sinus_a,id_sinus_l] = getMgenLevels( m, 'ID_SINUS' );  %#ok<ASGLU>
    [id_surface_i,id_surface_p,id_surface_a,id_surface_l] = getMgenLevels( m, 'ID_SURFACE' );  %#ok<ASGLU>
    [v_center_i,v_center_p,v_center_a,v_center_l] = getMgenLevels( m, 'V_CENTER' );  %#ok<ASGLU>
    [v_tip_i,v_tip_p,v_tip_a,v_tip_l] = getMgenLevels( m, 'V_TIP' );  %#ok<ASGLU>
    [id_switch1_i,id_switch1_p,id_switch1_a,id_switch1_l] = getMgenLevels( m, 'ID_SWITCH1' );  %#ok<ASGLU>
    [id_dist2_i,id_dist2_p,id_dist2_a,id_dist2_l] = getMgenLevels( m, 'ID_DIST2' );  %#ok<ASGLU>
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
    [v_theta_i,v_theta_p,v_theta_a,v_theta_l] = getMgenLevels( m, 'V_THETA' );  %#ok<ASGLU>
    [id_core_i,id_core_p,id_core_a,id_core_l] = getMgenLevels( m, 'ID_CORE' );  %#ok<ASGLU>

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
%              ID_BASE         ----    ----       ----     ----
%               ID_TIP         ----    ----       ----     ----
%            ID_BOTTOM         ----    ----       ----     ----
%            S_ADAXIAL         0.05    0.01       ----     ----
%            S_ABAXIAL         0.05    0.01       ----     ----
%             ID_SINUS         ----    ----       ----     ----
%           ID_SURFACE         ----    ----       ----     ----
%             V_CENTER         ----    ----       ----     ----
%                V_TIP         ----    ----       ----     ----
%           ID_SWITCH1         ----    ----       ----     ----
%             ID_DIST2         ----    ----       ----     ----
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
%              V_THETA         ----    ----       ----     ----
%              ID_CORE         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.
        
        v_theta_p = atan2(m.FEnodes(:,3), m.FEnodes(:,1))/pi;   % theta
        R0 = 1; % radius of the initial semisphere
 
        theta = pi/4;   % parameter theta [0, pi/4, pi/2]
        L0 = 5*R0/16;       % parameter L = R0-L0 [0, R0/4, R0/2, 3R0/4, R0]
        tol_L = 0.05;   
        
        if (theta == 0)  
            id_adaxial_p(m.FEnodes(:,1)>((R0-L0)+tol_L)) = 1;   
            id_abaxial_p(m.FEnodes(:,1)<((R0-L0)-tol_L)) = 1;
            
        elseif (theta == pi/2)
            id_adaxial_p(m.FEnodes(:,3)>((R0-L0)+tol_L)) = 1;   
            id_abaxial_p(m.FEnodes(:,3)<((R0-L0)-tol_L)) = 1;
            
        else
            id_adaxial_p(m.FEnodes(:,3)>(tan(pi-theta)*m.FEnodes(:,1))+...
                                    ((R0-L0)/sin(theta)+tol_L))=1;
            id_abaxial_p(m.FEnodes(:,3)<(tan(pi-theta)*m.FEnodes(:,1))+...
                                    ((R0-L0)/sin(theta)-tol_L))=1;
        end

        
        RADII_CORE = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2);
        
        s_abaxial_p = id_abaxial_p;
        m.morphogenclamp((id_abaxial_p == 1), s_abaxial_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_ABAXIAL', 0.05 );      % diffusion constant of S_ABAXIAL
        m = leaf_mgen_absorption( m, 'S_ABAXIAL', 0.01 );        % decay rate of S_ABAXIAL
        
        s_adaxial_p = id_adaxial_p;
        m.morphogenclamp((id_adaxial_p == 1), s_adaxial_i ) = 1;
        m = leaf_mgen_conductivity( m, 'S_ADAXIAL', 0.05 );      % diffusion constant of S_ADAXIAL
        m = leaf_mgen_absorption( m, 'S_ADAXIAL', 0.01 );        % decay rate of S_ADAXIAL
     
        RADII_CENTER = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2 + m.FEnodes(:,3).^2);
        id_midplane_p((s_adaxial_p < 0.8) & (s_abaxial_p < 0.8)) = 1;
        id_surface_p((RADII_CENTER > 0.95) & (~id_midplane_p)) = 1;

        id_core_p((RADII_CORE<=0.05)&(~id_adaxial_p)) = 1;
    
        tip = [ 0, 0, 1 ];
        RADII_TIP = sqrt((m.FEnodes(:,1) - tip(1)).^2 +...
                         (m.FEnodes(:,2) - tip(2)).^2 +...
                         (m.FEnodes(:,3) - tip(3)).^2);
        id_base_p(m.FEnodes(:,3) == min(m.FEnodes(:,3))) = 1;    
        id_tip_p(RADII_TIP <= 0.025)=1;

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
        kpar2_p = 0.8 * id_bottom_p;  % parameter H
    
    end
    
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
    
    % Growth 
    if (realtime > 3 - 0.001) && (realtime <= 20 - 0.001)   % time 18

        kpar2_p = 0.25;
        kpar_p = 0.001;
        kper_p = 0.15;

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
    m.morphogens(:,id_base_i) = id_base_p;
    m.morphogens(:,id_tip_i) = id_tip_p;
    m.morphogens(:,id_bottom_i) = id_bottom_p;
    m.morphogens(:,s_adaxial_i) = s_adaxial_p;
    m.morphogens(:,s_abaxial_i) = s_abaxial_p;
    m.morphogens(:,id_sinus_i) = id_sinus_p;
    m.morphogens(:,id_surface_i) = id_surface_p;
    m.morphogens(:,v_center_i) = v_center_p;
    m.morphogens(:,v_tip_i) = v_tip_p;
    m.morphogens(:,id_switch1_i) = id_switch1_p;
    m.morphogens(:,id_dist2_i) = id_dist2_p;
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
    m.morphogens(:,v_theta_i) = v_theta_p;
    m.morphogens(:,id_core_i) = id_core_p;

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

