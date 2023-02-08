function [m,result] = gpt_basicleaftypes_20230131( m, varargin )
%[m,result] = gpt_basicleaftypes_20230131( m, varargin )
%   Morphogen interaction function.
%   Written at 2023-01-31 19:16:01.
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
                'modelname', {'MODEL1',...  % Fig S13A, Simple leaf
                              'MODEL2',...  % Fig S13B, Unifacial leaf
                              'MODEL3',...  % Fig S13C, Peltate leaf
                              'MODEL4',...  % Fig S13D, Simple petal
                              'MODEL5',...  % Fig S13E, Peltately palmate compound leaf
                              'MODEL6',...  % Fig S13F, Pinnate compound leaf
                             }, 'MODEL6' ... % Model version name
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
%         m = leaf_makesecondlayer( m, 'mode', 'latlong',...
%                                      'hemisphere', 'n',...
%                                      'subdivisions', 40,...
%                                      'divisions', [16 8],...
%                                      'add', true );
                                 
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
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_dist_i,id_dist_p,id_dist_a,id_dist_l] = getMgenLevels( m, 'ID_DIST' );  %#ok<ASGLU>
    [id_stalk_i,id_stalk_p,id_stalk_a,id_stalk_l] = getMgenLevels( m, 'ID_STALK' );  %#ok<ASGLU>
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
    [s_blade_i,s_blade_p,s_blade_a,s_blade_l] = getMgenLevels( m, 'S_BLADE' );  %#ok<ASGLU>
    [v_radii1_i,v_radii1_p,v_radii1_a,v_radii1_l] = getMgenLevels( m, 'V_RADII1' );  %#ok<ASGLU>
    [v_radii2_i,v_radii2_p,v_radii2_a,v_radii2_l] = getMgenLevels( m, 'V_RADII2' );  %#ok<ASGLU>
    [v_theta_i,v_theta_p,v_theta_a,v_theta_l] = getMgenLevels( m, 'V_THETA' );  %#ok<ASGLU>
    [id_core_i,id_core_p,id_core_a,id_core_l] = getMgenLevels( m, 'ID_CORE' );  %#ok<ASGLU>
    [id_margin_i,id_margin_p,id_margin_a,id_margin_l] = getMgenLevels( m, 'ID_MARGIN' );  %#ok<ASGLU>
    [s_margin_i,s_margin_p,s_margin_a,s_margin_l] = getMgenLevels( m, 'S_MARGIN' );  %#ok<ASGLU>
    [id_blade_i,id_blade_p,id_blade_a,id_blade_l] = getMgenLevels( m, 'ID_BLADE' );  %#ok<ASGLU>
    [id_petiole_i,id_petiole_p,id_petiole_a,id_petiole_l] = getMgenLevels( m, 'ID_PETIOLE' );  %#ok<ASGLU>
    [id_tip_i,id_tip_p,id_tip_a,id_tip_l] = getMgenLevels( m, 'ID_TIP' );  %#ok<ASGLU>
    [id_leaflet_i,id_leaflet_p,id_leaflet_a,id_leaflet_l] = getMgenLevels( m, 'ID_LEAFLET' );  %#ok<ASGLU>
    [id_bottom_i,id_bottom_p,id_bottom_a,id_bottom_l] = getMgenLevels( m, 'ID_BOTTOM' );  %#ok<ASGLU>
    [id_top_i,id_top_p,id_top_a,id_top_l] = getMgenLevels( m, 'ID_TOP' );  %#ok<ASGLU>

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
%              ID_DIST         ----    ----       ----     ----
%             ID_STALK         ----    ----       ----     ----
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
%              S_BLADE          0.1    ----       ----     ----
%             V_RADII1         ----    ----       ----     ----
%             V_RADII2         ----    ----       ----     ----
%              V_THETA         ----    ----       ----     ----
%              ID_CORE         ----    ----       ----     ----
%            ID_MARGIN         ----    ----       ----     ----
%             S_MARGIN          0.2    0.01       ----     ----
%             ID_BLADE         ----    ----       ----     ----
%           ID_PETIOLE         ----    ----       ----     ----
%               ID_TIP         ----    ----       ----     ----
%           ID_LEAFLET         ----    ----       ----     ----
%            ID_BOTTOM         ----    ----       ----     ----
%               ID_TOP         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.
        
        % AD/AB patterning at the first beginning 
        switch OPTIONS.modelname
            
            case { 'MODEL1', 'MODEL4', 'MODEL6' }
                
                R0 = 1; 
                theta = 0;  
                L = R0;  
                tol_L = 0.05;
                
            case 'MODEL2'
                
                R0 = 1; 
                theta = 0;  
                L = 3*R0/4;  
                tol_L = 0.05;
                           
            case { 'MODEL3', 'MODEL5' }
                
                R0 = 1; % radius of the initial semisphere
                theta = pi/2;   % [0, pi/4, pi/2]
                L = 5*R0/8;    % [0, R0/4, R0/2, 3R0/4, R0]
                tol_L = 0.05;

        end
        
        if (theta == 0)  
           id_adaxial_p(m.FEnodes(:,1)>((R0-L)+tol_L)) = 1;   
           id_abaxial_p(m.FEnodes(:,1)<((R0-L)-tol_L)) = 1;
            
        elseif (theta == pi/2)
           id_adaxial_p(m.FEnodes(:,3)>((R0-L)+tol_L)) = 1;   
           id_abaxial_p(m.FEnodes(:,3)<((R0-L)-tol_L)) = 1;
            
        else
           id_adaxial_p(m.FEnodes(:,3)>(tan(pi-theta)*m.FEnodes(:,1))+...
                       ((R0-L)/sin(theta)+tol_L))=1;
           id_abaxial_p(m.FEnodes(:,3)<(tan(pi-theta)*m.FEnodes(:,1))+...
                       ((R0-L)/sin(theta)-tol_L))=1;
        end
        
        s_abaxial_p = id_abaxial_p;
        m.morphogenclamp((id_abaxial_p == 1), s_abaxial_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_ABAXIAL', 0.05 );      % diffusion constant of S_ABAXIAL
        m = leaf_mgen_absorption( m, 'S_ABAXIAL', 0.01 );        % decay rate of S_ABAXIAL
        
        s_adaxial_p = id_adaxial_p;
        m.morphogenclamp((id_adaxial_p == 1), s_adaxial_i ) = 1;
        m = leaf_mgen_conductivity( m, 'S_ADAXIAL', 0.05 );      % diffusion constant of S_ADAXIAL
        m = leaf_mgen_absorption( m, 'S_ADAXIAL', 0.01 );        % decay rate of S_ADAXIAL
        
 
%         v_theta_p = atan2(m.FEnodes(:,3), m.FEnodes(:,1))/pi;   % theta
%         R0 = 1; % radius of the initial semisphere
%         theta = pi/2;   % [0, pi/4, pi/2]
%         R = 5*R0/8;    % [0, R0/4, R0/2, 3R0/4, R0]
%         tol_R = 0.05;
% 
%         if (theta == 0)  
%             id_adaxial_p(m.FEnodes(:,1)>((R0-R)+tol_R)) = 1;   
%             id_abaxial_p(m.FEnodes(:,1)<((R0-R)-tol_R)) = 1;
%             
%         elseif (theta == pi/2)
%             id_adaxial_p(m.FEnodes(:,3)>((R0-R)+tol_R)) = 1;   
%             id_abaxial_p(m.FEnodes(:,3)<((R0-R)-tol_R)) = 1;
%             
%         else
%             id_adaxial_p(m.FEnodes(:,3)>(tan(pi-theta)*m.FEnodes(:,1))+...
%                                     ((R0-R)/sin(theta)+tol_R))=1;
%             id_abaxial_p(m.FEnodes(:,3)<(tan(pi-theta)*m.FEnodes(:,1))+...
%                                     ((R0-R)/sin(theta)-tol_R))=1;
%         end

        
        RADII_CORE = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2);
        RADII_CENTER = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2 + m.FEnodes(:,3).^2);
        
        id_midplane_p((s_adaxial_p < 0.8) & (s_abaxial_p < 0.8)) = 1;  % factor MIP
        id_surface_p((RADII_CENTER > 0.95) & (~id_midplane_p)) = 1;  % factor SURF
        
        TIP =[0,0,1];
        RADII_TIP = sqrt((m.FEnodes(:,1)-TIP(1)).^2 +...
                         (m.FEnodes(:,2)-TIP(2)).^2 +...
                         (m.FEnodes(:,3)-TIP(3)).^2);
        id_top_p(RADII_TIP<0.3)=1;             

        id_core_p((RADII_CORE<=0.05)&(~id_adaxial_p)&(~id_midplane_p)) = 1;  % factor CORE
        
        % NOT USE
        id_margin_p((id_midplane_p)&(RADII_CENTER>0.95))=1;
        s_margin_p = id_margin_p;
        m.morphogenclamp((id_margin_p == 1), s_margin_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_MARGIN', 0.2 );     
        m = leaf_mgen_absorption( m, 'S_MARGIN', 0.01 );  
    
        tip = [0, 0, 1];
%         RADII_TIP = sqrt((m.FEnodes(:,1) - tip(1)).^2 +...
%                          (m.FEnodes(:,2) - tip(2)).^2 +...
%                          (m.FEnodes(:,3) - tip(3)).^2);
        id_base_p(m.FEnodes(:,3) == min(m.FEnodes(:,3))) = 1; 
%         
%         
%         id_tip_p((petalmidnodes)&(id_midplane_p)&(RADII_CENTER>0.95)) = 1;
          

        id_bottom_p(m.FEnodes(:,3) < 0.2) = 1;
        id_stalk_p(m.FEnodes(:,3) < 0.12) = 1;  % factor STK
        
        % factor BLA and SINUS
        switch OPTIONS.modelname 
            
            case { 'MODEL1', 'MODEL2', 'MODEL3' }
                
                id_blade_p(m.FEnodes(:,3) > 0.28) = 1;
                s_blade_p = id_blade_p;
                m.morphogenclamp((id_blade_p == 1), s_blade_i) = 1;
                m = leaf_mgen_conductivity( m, 'S_BLADE', 0.1 );
                m = leaf_mgen_absorption( m, 'S_BLADE', 0.01 );  
                
                id_sinus_p(:) = 0; 
                id_tip_p(RADII_TIP <= 0.025)=1;
                
            case 'MODEL4'
                
                id_blade_p(m.FEnodes(:,3) > 0.28) = 1;
                s_blade_p = id_blade_p;
                m.morphogenclamp((id_blade_p == 1), s_blade_i) = 1;
                m = leaf_mgen_conductivity( m, 'S_BLADE', 0.1 );
                m = leaf_mgen_absorption( m, 'S_BLADE', 0.01 );  
                
                id_sinus_p(:) = 0;
                id_tip_p((abs(m.FEnodes(:,1)) < 0.01) &...
                         (abs(m.FEnodes(:,2)) < 0.9 ) &...
                         (RADII_CENTER > 0.95)) = 1; 
            
            case 'MODEL5'
                
                v_theta_p = atan2(m.FEnodes(:,2), m.FEnodes(:,1)) * (0.5/pi);
        
                leafborderv_theta = (1:5)*0.2 - 0.5;
                leafmidv_theta = leafborderv_theta - 0.1;
                v_thetatol = 0.01;
                v_thetatol2 = 0.03;
                v_thetatol3 = 0.05;
        
                leafbordernodes = false( size(m.FEnodes,1), 1 );
                leafmidnodes = false( size(m.FEnodes,1), 1 );
                leafmidnodes2 = false( size(m.FEnodes,1), 1 );
        
                for i=1:length(v_theta_p)
                    th = v_theta_p(i);
                    bth = abs(leafborderv_theta-th);
                    
                    if any( (bth < v_thetatol3) | (1-bth < v_thetatol3) )
                        leafbordernodes(i) = true;
                    end
            
                    mth = abs(leafmidv_theta-th);
                
                    if any( (mth < v_thetatol) | (1-mth < v_thetatol) )
                        leafmidnodes(i) = true;
                    end
            
                    mth2 = abs(leafmidv_theta-th);
                    
                    if any( (mth2 < v_thetatol2) | (1-mth2 < v_thetatol2) )
                        leafmidnodes2(i) = true;
                    end
                end
                 
                id_blade_p((leafmidnodes2)&(id_midplane_p)&(RADII_CENTER>0.95)) = 1; 
                s_blade_p = id_blade_p;
                m.morphogenclamp((id_blade_p == 1), s_blade_i) = 1;
                m = leaf_mgen_conductivity( m, 'S_BLADE', 0.1 );
                m = leaf_mgen_absorption( m, 'S_BLADE', 0.01 );  
                
                id_sinus_p((leafbordernodes)&(id_midplane_p)&(RADII_CENTER>0.95))=1;
                id_tip_p((leafmidnodes)&(id_midplane_p)&(RADII_CENTER>0.95)) = 1;
                
                
            case 'MODEL6'
                
                cp1 = [ 0, 0.6, 0.8];
                cp2 = [ 0, -0.6, 0.8];
                cp3 = [ 0, 0.9, 0.4];
                cp4 = [ 0, -0.9, 0.4];

                TIP = sqrt((m.FEnodes(:,1) - tip(1)).^2 + (m.FEnodes(:,2) - tip(2)).^2 + (m.FEnodes(:,3) - tip(3)).^2);
                CP1 = sqrt((m.FEnodes(:,1) - cp1(1)).^2 + (m.FEnodes(:,2) - cp1(2)).^2 + (m.FEnodes(:,3) - cp1(3)).^2);
                CP2 = sqrt((m.FEnodes(:,1) - cp2(1)).^2 + (m.FEnodes(:,2) - cp2(2)).^2 + (m.FEnodes(:,3) - cp2(3)).^2);
                CP3 = sqrt((m.FEnodes(:,1) - cp3(1)).^2 + (m.FEnodes(:,2) - cp3(2)).^2 + (m.FEnodes(:,3) - cp3(3)).^2);
                CP4 = sqrt((m.FEnodes(:,1) - cp4(1)).^2 + (m.FEnodes(:,2) - cp4(2)).^2 + (m.FEnodes(:,3) - cp4(3)).^2);
        
                sinus1 = [ 0, 0.3, 0.95];
                sinus2 = [ 0, -0.3, 0.95];
                sinus3 = [ 0, 0.8, 0.6];
                sinus4 = [ 0, -0.8, 0.6];
                SIN1 = sqrt((m.FEnodes(:,1) - sinus1(1)).^2 + (m.FEnodes(:,2) - sinus1(2)).^2 + (m.FEnodes(:,3) - sinus1(3)).^2);
                SIN2 = sqrt((m.FEnodes(:,1) - sinus2(1)).^2 + (m.FEnodes(:,2) - sinus2(2)).^2 + (m.FEnodes(:,3) - sinus2(3)).^2);
                SIN3 = sqrt((m.FEnodes(:,1) - sinus3(1)).^2 + (m.FEnodes(:,2) - sinus3(2)).^2 + (m.FEnodes(:,3) - sinus3(3)).^2);
                SIN4 = sqrt((m.FEnodes(:,1) - sinus4(1)).^2 + (m.FEnodes(:,2) - sinus4(2)).^2 + (m.FEnodes(:,3) - sinus4(3)).^2);
                id_sinus_p((SIN1 <= 0.2)|(SIN2 <= 0.2)|(SIN3 <= 0.2)|(SIN4 <= 0.2))=1;

                id_tip_p((TIP < 0.05)|(CP1 < 0.05)|(CP2 < 0.05)|(CP3 < 0.05)|(CP4 < 0.05))=1;
        
                id_blade_p((TIP <= 0.1)|(CP1 <= 0.1)|(CP2 <= 0.1)|(CP3 <= 0.1)|(CP4 <= 0.1))=1;
                s_blade_p = id_blade_p;
                m.morphogenclamp((id_blade_p == 1), s_blade_i) = 1;
                m = leaf_mgen_conductivity( m, 'S_BLADE', 0.1 );
                m = leaf_mgen_absorption( m, 'S_BLADE', 0.01 ); 

            
        end
%         id_blade_p(m.FEnodes(:,3) > 0.28) = 1;  % factor BLA
%         
%         id_sinus_p((petalbordernodes)&(id_midplane_p)&(RADII_CENTER>0.95))=1;  % factor SINUS
              
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
        kpar2_p = 0.8 * id_bottom_p;
        
    end
    
    if (realtime > 3 - 0.0001) && (realtime <= 4 - 0.0001)
        
        pol_p=0;
        pol2_p=0;
                
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
    
    if (realtime > 4 - 0.001) && (realtime <= 20 - 0.001)   % time 18
        
        switch OPTIONS.modelname
            
            case 'MODEL1'
                
                kpar_p = 0.001;
                kpar2_p = 0.25 * pro(0.2,id_blade_p);
                kper_p = 0.15*inh(20, id_stalk_p).*pro(0.2,id_blade_p);
                
            case 'MODEL2'
                
                kpar_p = 0.001;
                kper_p = 0.2 * (1 + 0.5*id_stalk_p);
                kpar2_p = 0.5 * (1 + 0.2*id_stalk_p + 1*id_blade_p);
                
            case 'MODEL3'
                
                kpar_p = 0.001;
                kpar2_p = 0.25*pro(0.5,id_stalk_p).*(1 + 0.8*s_margin_p.*s_blade_p).*inh(3,id_top_p);
                kper_p = 0.15*inh(20,id_stalk_p).*(1 + 0.2*s_margin_p.*s_blade_p).*inh(3,id_top_p);
                
            case 'MODEL4'
                
                kpar_p = 0.001;
                kpar2_p = 0.25 * pro(0.2,id_blade_p);
                kper_p = 0.15*inh(20, id_stalk_p).*pro(0.2,id_blade_p);
                
            case 'MODEL5'
                
                kpar2_p = 1 * pro(0.5,id_stalk_p) .* (0.25 + 0.8*s_lip_p)...
                           .* inh(3,id_top_p).*inh(20,id_sinus_p);
                kpar_p = 0.001;
                kper_p = 1 * inh(20,id_stalk_p) .* (0.15 + 0.3*s_lip_p)...
                          .* inh(3,id_top_p) .* inh(20,id_sinus_p);
                
            case 'MODEL6'
                
                kpar_p = 0.001;
                kper_p = 0.3*s_blade_p .* inh(20, id_stalk_p).* inh(20, id_sinus_p);
                kpar2_p = (0.05 + 0.5*s_blade_p) .* inh(20, id_sinus_p) .* pro(0.5, id_stalk_p);
                
            
        end

        

    end
    
%     if (realtime > 6 - 0.001) && (realtime <= 7 - 0.001)
%         
%         m = leaf_plotoptions( m, 'morphogen', { 'id_adaxial2', 'id_abaxial2', 'id_midplane2', 'id_core' });
%         m = leaf_plotpriority( m, { 'id_adaxial2', 'id_abaxial2', 'id_midplane2', 'id_core' },...
%                                   [ 1, 1, 2, 2 ], [ 0.5, 0.5, 0.5, 0.5 ], 'type', 'morphogen' );
% 
%         pol_p = id_surface2_p - id_midplane2_p - id_core_p;    % POL generated from the surface region and removed in the midplane region
%         m.morphogenclamp((id_surface2_p == 1)|(id_midplane2_p == 1)|(id_core_p == 1), pol_i) = 1;
%         m = leaf_mgen_conductivity( m, 'POL', 0.1 );     % diffusion constant of POL
%         m = leaf_mgen_absorption( m, 'POL', 0.01 );      % decay rate of POL
% 
%         pol2_p = id_prox_p - id_dist_p;   % POL2 generated from the proximal region and removed in the distal region
%         m.morphogenclamp((id_prox_p == 1)|(id_dist_p == 1), pol2_i) = 1;
%         m = leaf_mgen_conductivity( m, 'POL2', 0.1 );         % diffusion constant of POL2
%         m = leaf_mgen_absorption( m, 'POL2', 0.01 );          % decay rate of POL2
%         
%         kpar2_p = 0;
%         kpar_p = 0;
%         kper_p = 0;
%         
%     end
%     
%     if (realtime > 7 - 0.001) && (realtime <= 15 - 0.001)
%         
%         kpar2_p = 0.25;
%         kpar_p = 0.01;
%         kper_p = 0.15;
% 
%     end
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
    m.morphogens(:,id_dist_i) = id_dist_p;
    m.morphogens(:,id_stalk_i) = id_stalk_p;
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
    m.morphogens(:,s_blade_i) = s_blade_p;
    m.morphogens(:,v_radii1_i) = v_radii1_p;
    m.morphogens(:,v_radii2_i) = v_radii2_p;
    m.morphogens(:,v_theta_i) = v_theta_p;
    m.morphogens(:,id_core_i) = id_core_p;
    m.morphogens(:,id_margin_i) = id_margin_p;
    m.morphogens(:,s_margin_i) = s_margin_p;
    m.morphogens(:,id_blade_i) = id_blade_p;
    m.morphogens(:,id_petiole_i) = id_petiole_p;
    m.morphogens(:,id_tip_i) = id_tip_p;
    m.morphogens(:,id_leaflet_i) = id_leaflet_p;
    m.morphogens(:,id_bottom_i) = id_bottom_p;
    m.morphogens(:,id_top_i) = id_top_p;

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

