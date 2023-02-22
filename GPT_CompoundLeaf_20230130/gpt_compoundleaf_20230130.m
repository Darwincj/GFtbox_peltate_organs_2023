function [m,result] = gpt_compoundleaf_20230130( m, varargin )
%[m,result] = gpt_compoundleaf_20230130( m, varargin )
%   Morphogen interaction function.
%   Written at 2023-01-30 15:48:28.
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
            m = setUpModelOptions( m, 'modelname', {...
                   'MODEL1', ...  % Fig S14,D Leaf of Mimosa pudica
                   'MODEL2', ...  % Fig S14,E Leaf of Medicago truncatula 
                   'MODEL3', ...  % Fig S14,F Leaf of Cardamine hirsuta
                   'MODEL4'  ...  % Fig S14,G Leaf of Pisum sativum
                   }, 'MODEL4' ... % Model version name
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
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

    polariser_i = FindMorphogenRole( m, 'POLARISER' );
    P = m.morphogens(:,polariser_i);
    [kapar_i,kapar_p,kapar_a,kapar_l] = getMgenLevels( m, 'KAPAR' );  %#ok<ASGLU>
    [kaper_i,kaper_p,kaper_a,kaper_l] = getMgenLevels( m, 'KAPER' );  %#ok<ASGLU>
    [kbpar_i,kbpar_p,kbpar_a,kbpar_l] = getMgenLevels( m, 'KBPAR' );  %#ok<ASGLU>
    [kbper_i,kbper_p,kbper_a,kbper_l] = getMgenLevels( m, 'KBPER' );  %#ok<ASGLU>
    [knor_i,knor_p,knor_a,knor_l] = getMgenLevels( m, 'KNOR' );  %#ok<ASGLU>
    [strainret_i,strainret_p,strainret_a,strainret_l] = getMgenLevels( m, 'STRAINRET' );  %#ok<ASGLU>
    [arrest_i,arrest_p,arrest_a,arrest_l] = getMgenLevels( m, 'ARREST' );  %#ok<ASGLU>
    [id_rachis_i,id_rachis_p,id_rachis_a,id_rachis_l] = getMgenLevels( m, 'ID_RACHIS' );  %#ok<ASGLU>
    [id_tl_i,id_tl_p,id_tl_a,id_tl_l] = getMgenLevels( m, 'ID_TL' );  %#ok<ASGLU>
    [id_stipule_i,id_stipule_p,id_stipule_a,id_stipule_l] = getMgenLevels( m, 'ID_STIPULE' );  %#ok<ASGLU>
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_ll_1_i,id_ll_1_p,id_ll_1_a,id_ll_1_l] = getMgenLevels( m, 'ID_LL_1' );  %#ok<ASGLU>
    [id_ll_2_i,id_ll_2_p,id_ll_2_a,id_ll_2_l] = getMgenLevels( m, 'ID_LL_2' );  %#ok<ASGLU>
    [id_ll_3_i,id_ll_3_p,id_ll_3_a,id_ll_3_l] = getMgenLevels( m, 'ID_LL_3' );  %#ok<ASGLU>
    [id_tip1_i,id_tip1_p,id_tip1_a,id_tip1_l] = getMgenLevels( m, 'ID_TIP1' );  %#ok<ASGLU>
    [id_tip2_i,id_tip2_p,id_tip2_a,id_tip2_l] = getMgenLevels( m, 'ID_TIP2' );  %#ok<ASGLU>
    [id_tip3_i,id_tip3_p,id_tip3_a,id_tip3_l] = getMgenLevels( m, 'ID_TIP3' );  %#ok<ASGLU>
    [id_tip4_i,id_tip4_p,id_tip4_a,id_tip4_l] = getMgenLevels( m, 'ID_TIP4' );  %#ok<ASGLU>
    [id_sinus_i,id_sinus_p,id_sinus_a,id_sinus_l] = getMgenLevels( m, 'ID_SINUS' );  %#ok<ASGLU>
    [id_add_i,id_add_p,id_add_a,id_add_l] = getMgenLevels( m, 'ID_ADD' );  %#ok<ASGLU>
    [id_top_i,id_top_p,id_top_a,id_top_l] = getMgenLevels( m, 'ID_TOP' );  %#ok<ASGLU>
    [id_midvein_i,id_midvein_p,id_midvein_a,id_midvein_l] = getMgenLevels( m, 'ID_MIDVEIN' );  %#ok<ASGLU>
    [id_ll_4_i,id_ll_4_p,id_ll_4_a,id_ll_4_l] = getMgenLevels( m, 'ID_LL_4' );  %#ok<ASGLU>
    [karea_i,karea_p,karea_a,karea_l] = getMgenLevels( m, 'KAREA' );  %#ok<ASGLU>

% Mesh type: lobes
%            base: 0
%   circumference: 0
%        cylinder: 0
%          height: 41
% innercircumference: 0
%          layers: 0
%           lobes: 1
%             new: 0
%          radius: 1
%      randomness: 0
%           rings: 4
%          strips: 160
%       thickness: 0

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                KAPAR         ----    ----       ----     ----
%                KAPER         ----    ----       ----     ----
%                KBPAR         ----    ----       ----     ----
%                KBPER         ----    ----       ----     ----
%                 KNOR         ----    ----       ----     ----
%            POLARISER          0.1    0.01       ----     ----
%            STRAINRET         ----    ----       ----     ----
%               ARREST         ----    ----       ----     ----
%            ID_RACHIS         ----    ----       ----     ----
%                ID_TL         ----    ----       ----     ----
%           ID_STIPULE         ----    ----       ----     ----
%              ID_BASE         ----    ----       ----     ----
%              ID_LL_1         ----    ----       ----     ----
%              ID_LL_2         ----    ----       ----     ----
%              ID_LL_3         ----    ----       ----     ----
%              ID_TIP1         ----    ----       ----     ----
%              ID_TIP2         ----    ----       ----     ----
%              ID_TIP3         ----    ----       ----     ----
%              ID_TIP4         ----    ----       ----     ----
%             ID_SINUS         ----    ----       ----     ----
%               ID_ADD         ----    ----       ----     ----
%               ID_TOP         ----    ----       ----     ----
%           ID_MIDVEIN         ----    ----       ----     ----
%              ID_LL_4         ----    ----       ----     ----
%                KAREA         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.
        top = [0, 21];
        center = [0, 20];
        TOP = sqrt((m.nodes(:,1)-top(1)).^2+(m.nodes(:,2)-top(2)).^2);
        RADII = sqrt((m.nodes(:,1)-center(1)).^2+(m.nodes(:,2)-center(2)).^2);
        
        
        switch OPTIONS.modelname  
            
            case 'MODEL1'
                
                left_tip0 = [-1,  0*10/39];
                left_tip1 = [-1, 12*10/39];
                left_tip2 = [-1, 24*10/39];
                left_tip3 = [-1, 36*10/39];
                left_tip4 = [-1, 48*10/39];
                left_tip5 = [-1, 60*10/39];
                left_tip6 = [-1, 72*10/39];
                left_tip7 = [-1, 84*10/39];
                left_tip_1 = [-1, -12*10/39];
                left_tip_2 = [-1, -24*10/39];
                left_tip_3 = [-1, -36*10/39];
                left_tip_4 = [-1, -48*10/39];
                left_tip_5 = [-1, -60*10/39];
                right_tip0 = [1,  0*10/39];
                right_tip1 = [1, 12*10/39];
                right_tip2 = [1, 24*10/39];
                right_tip3 = [1, 36*10/39];
                right_tip4 = [1, 48*10/39];
                right_tip5 = [1, 60*10/39];
                right_tip6 = [1, 72*10/39];
                right_tip7 = [1, 84*10/39];
                right_tip_1 = [1, -12*10/39];
                right_tip_2 = [1, -24*10/39];
                right_tip_3 = [1, -36*10/39];
                right_tip_4 = [1, -48*10/39];
                right_tip_5 = [1, -60*10/39];
        
                LEFT_TIP0 = sqrt((m.nodes(:,1)-left_tip0(1)).^2+(m.nodes(:,2)-left_tip0(2)).^2);
                LEFT_TIP1 = sqrt((m.nodes(:,1)-left_tip1(1)).^2+(m.nodes(:,2)-left_tip1(2)).^2);
                LEFT_TIP2 = sqrt((m.nodes(:,1)-left_tip2(1)).^2+(m.nodes(:,2)-left_tip2(2)).^2);
                LEFT_TIP3 = sqrt((m.nodes(:,1)-left_tip3(1)).^2+(m.nodes(:,2)-left_tip3(2)).^2);
                LEFT_TIP4 = sqrt((m.nodes(:,1)-left_tip4(1)).^2+(m.nodes(:,2)-left_tip4(2)).^2);
                LEFT_TIP5 = sqrt((m.nodes(:,1)-left_tip5(1)).^2+(m.nodes(:,2)-left_tip5(2)).^2);
                LEFT_TIP6 = sqrt((m.nodes(:,1)-left_tip6(1)).^2+(m.nodes(:,2)-left_tip6(2)).^2);
                LEFT_TIP7 = sqrt((m.nodes(:,1)-left_tip7(1)).^2+(m.nodes(:,2)-left_tip7(2)).^2);
                LEFT_TIP_1 = sqrt((m.nodes(:,1)-left_tip_1(1)).^2+(m.nodes(:,2)-left_tip_1(2)).^2);
                LEFT_TIP_2 = sqrt((m.nodes(:,1)-left_tip_2(1)).^2+(m.nodes(:,2)-left_tip_2(2)).^2);
                LEFT_TIP_3 = sqrt((m.nodes(:,1)-left_tip_3(1)).^2+(m.nodes(:,2)-left_tip_3(2)).^2);
                LEFT_TIP_4 = sqrt((m.nodes(:,1)-left_tip_4(1)).^2+(m.nodes(:,2)-left_tip_4(2)).^2);
                LEFT_TIP_5 = sqrt((m.nodes(:,1)-left_tip_5(1)).^2+(m.nodes(:,2)-left_tip_5(2)).^2);
                RIGHT_TIP0 = sqrt((m.nodes(:,1)-right_tip0(1)).^2+(m.nodes(:,2)-right_tip0(2)).^2);
                RIGHT_TIP1 = sqrt((m.nodes(:,1)-right_tip1(1)).^2+(m.nodes(:,2)-right_tip1(2)).^2);
                RIGHT_TIP2 = sqrt((m.nodes(:,1)-right_tip2(1)).^2+(m.nodes(:,2)-right_tip2(2)).^2);
                RIGHT_TIP3 = sqrt((m.nodes(:,1)-right_tip3(1)).^2+(m.nodes(:,2)-right_tip3(2)).^2);
                RIGHT_TIP4 = sqrt((m.nodes(:,1)-right_tip4(1)).^2+(m.nodes(:,2)-right_tip4(2)).^2);
                RIGHT_TIP5 = sqrt((m.nodes(:,1)-right_tip5(1)).^2+(m.nodes(:,2)-right_tip5(2)).^2);
                RIGHT_TIP6 = sqrt((m.nodes(:,1)-right_tip6(1)).^2+(m.nodes(:,2)-right_tip6(2)).^2);
                RIGHT_TIP7 = sqrt((m.nodes(:,1)-right_tip7(1)).^2+(m.nodes(:,2)-right_tip7(2)).^2);
                RIGHT_TIP_1 = sqrt((m.nodes(:,1)-right_tip_1(1)).^2+(m.nodes(:,2)-right_tip_1(2)).^2);
                RIGHT_TIP_2 = sqrt((m.nodes(:,1)-right_tip_2(1)).^2+(m.nodes(:,2)-right_tip_2(2)).^2);
                RIGHT_TIP_3 = sqrt((m.nodes(:,1)-right_tip_3(1)).^2+(m.nodes(:,2)-right_tip_3(2)).^2);
                RIGHT_TIP_4 = sqrt((m.nodes(:,1)-right_tip_4(1)).^2+(m.nodes(:,2)-right_tip_4(2)).^2);
                RIGHT_TIP_5 = sqrt((m.nodes(:,1)-right_tip_5(1)).^2+(m.nodes(:,2)-right_tip_5(2)).^2);

                id_tip1_p((LEFT_TIP0<0.1)|(RIGHT_TIP0<0.1)|...
                          (LEFT_TIP1<0.1)|(RIGHT_TIP1<0.1)|...
                          (LEFT_TIP2<0.1)|(RIGHT_TIP2<0.1)|...
                          (LEFT_TIP3<0.1)|(RIGHT_TIP3<0.1)|...
                          (LEFT_TIP4<0.1)|(RIGHT_TIP4<0.1)|...
                          (LEFT_TIP5<0.1)|(RIGHT_TIP5<0.1)|...
                          (LEFT_TIP6<0.1)|(RIGHT_TIP6<0.1)|...
                          (LEFT_TIP7<0.1)|(RIGHT_TIP7<0.1)|...
                          (LEFT_TIP_1<0.1)|(RIGHT_TIP_1<0.1)|...
                          (LEFT_TIP_2<0.1)|(RIGHT_TIP_2<0.1)|...
                          (LEFT_TIP_3<0.1)|(RIGHT_TIP_3<0.1)|...
                          (LEFT_TIP_4<0.1)|(RIGHT_TIP_4<0.1)|...
                          (LEFT_TIP_5<0.1)|(RIGHT_TIP_5<0.1)...
                         )=1;
                     
                id_add_p((LEFT_TIP0<0.48)|(RIGHT_TIP0<0.48)|...   % lateral leaflet
                         (LEFT_TIP1<0.48)|(RIGHT_TIP1<0.48)|...
                         (LEFT_TIP2<0.48)|(RIGHT_TIP2<0.48)|...
                         (LEFT_TIP3<0.48)|(RIGHT_TIP3<0.48)|...
                         (LEFT_TIP4<0.48)|(RIGHT_TIP4<0.48)|...
                         (LEFT_TIP5<0.48)|(RIGHT_TIP5<0.48)|...
                         (LEFT_TIP6<0.48)|(RIGHT_TIP6<0.48)|...
                         (LEFT_TIP7<0.48)|(RIGHT_TIP7<0.48)|...
                         (LEFT_TIP_1<0.48)|(RIGHT_TIP_1<0.48)|...
                         (LEFT_TIP_2<0.48)|(RIGHT_TIP_2<0.48)|...
                         (LEFT_TIP_3<0.48)|(RIGHT_TIP_3<0.48)|...
                         (LEFT_TIP_4<0.48)|(RIGHT_TIP_4<0.48)|...
                         (LEFT_TIP_5<0.48)|(RIGHT_TIP_5<0.48)...
                        )=1;
            
                id_sinus_p(((abs(m.nodes(:,1))>0.6)&(m.nodes(:,2)<20)&(~id_add_p))|...
                              ((RADII>0.6)&(m.nodes(:,2)>=20)))=1;
                id_midvein_p((abs(m.nodes(:,1))<0.05)&(m.nodes(:,2)<20))=1; 
                          
            case 'MODEL2'
                
                left_tip1 = [-1,  (20-160/39)];
                left_tip2 = [-1,  10];
                left_tip3 = [-1,  0];
                left_tip4 = [-1, -20]; 
                right_tip1 = [1,  (20-160/39)];
                right_tip2 = [1,  10];
                right_tip3 = [1,  0];
                right_tip4 = [1, -20];
                
                LEFT_TIP1 = sqrt((m.nodes(:,1)-left_tip1(1)).^2+(m.nodes(:,2)-left_tip1(2)).^2);
                LEFT_TIP2 = sqrt((m.nodes(:,1)-left_tip2(1)).^2+(m.nodes(:,2)-left_tip2(2)).^2);
                LEFT_TIP3 = sqrt((m.nodes(:,1)-left_tip3(1)).^2+(m.nodes(:,2)-left_tip3(2)).^2);
                LEFT_TIP4 = sqrt((m.nodes(:,1)-left_tip4(1)).^2+(m.nodes(:,2)-left_tip4(2)).^2);
                RIGHT_TIP1 = sqrt((m.nodes(:,1)-right_tip1(1)).^2+(m.nodes(:,2)-right_tip1(2)).^2);
                RIGHT_TIP2 = sqrt((m.nodes(:,1)-right_tip2(1)).^2+(m.nodes(:,2)-right_tip2(2)).^2);
                RIGHT_TIP3 = sqrt((m.nodes(:,1)-right_tip3(1)).^2+(m.nodes(:,2)-right_tip3(2)).^2);
                RIGHT_TIP4 = sqrt((m.nodes(:,1)-right_tip4(1)).^2+(m.nodes(:,2)-right_tip4(2)).^2);
                
                id_tip1_p((LEFT_TIP1<0.1)|(RIGHT_TIP1<0.1))=1;
                id_tip2_p((LEFT_TIP2<0.1)|(RIGHT_TIP2<0.1))=1;
                id_tip3_p((LEFT_TIP3<0.1)|(RIGHT_TIP3<0.1))=1;
                id_tip4_p((LEFT_TIP4<0.1)|(RIGHT_TIP4<0.1))=1;
        
                id_tl_p(TOP<0.35)=1;  % top leaflet
                id_ll_1_p((LEFT_TIP1<0.5)|(RIGHT_TIP1<0.5))=1;  % lateral leaflet
                id_add_p((id_tl_p)|(id_ll_1_p)|(id_ll_4_p))=1;
                id_sinus_p(((abs(m.nodes(:,1))>0.6)&(m.nodes(:,2)<20)&(~id_ll_1_p))|...
                           ((RADII>0.6)&(m.nodes(:,2)>=20)&(~id_tl_p)))=1;
                id_rachis_p((~id_sinus_p)&(~id_tl_p)&(~id_ll_4_p)&...
                            (~id_ll_1_p))=1;  
                id_midvein_p((abs(m.nodes(:,1))<0.05)&(m.nodes(:,2)<20))=1;   
            
            case 'MODEL3'
                
                left_tip1 = [-1,  10];
                left_tip2 = [-1,   0];
                left_tip3 = [-1, -10];
                left_tip4 = [-1, -20];
                right_tip1 = [1,  10];
                right_tip2 = [1,   0];
                right_tip3 = [1, -10];
                right_tip4 = [1, -20];

                TOP = sqrt((m.nodes(:,1)-top(1)).^2+(m.nodes(:,2)-top(2)).^2);
                RADII = sqrt((m.nodes(:,1)-center(1)).^2+(m.nodes(:,2)-center(2)).^2);
                LEFT_TIP1 = sqrt((m.nodes(:,1)-left_tip1(1)).^2+(m.nodes(:,2)-left_tip1(2)).^2);
                LEFT_TIP2 = sqrt((m.nodes(:,1)-left_tip2(1)).^2+(m.nodes(:,2)-left_tip2(2)).^2);
                LEFT_TIP3 = sqrt((m.nodes(:,1)-left_tip3(1)).^2+(m.nodes(:,2)-left_tip3(2)).^2);
                LEFT_TIP4 = sqrt((m.nodes(:,1)-left_tip4(1)).^2+(m.nodes(:,2)-left_tip4(2)).^2);
                RIGHT_TIP1 = sqrt((m.nodes(:,1)-right_tip1(1)).^2+(m.nodes(:,2)-right_tip1(2)).^2);
                RIGHT_TIP2 = sqrt((m.nodes(:,1)-right_tip2(1)).^2+(m.nodes(:,2)-right_tip2(2)).^2);
                RIGHT_TIP3 = sqrt((m.nodes(:,1)-right_tip3(1)).^2+(m.nodes(:,2)-right_tip3(2)).^2);
                RIGHT_TIP4 = sqrt((m.nodes(:,1)-right_tip4(1)).^2+(m.nodes(:,2)-right_tip4(2)).^2);
        
                id_tip1_p((LEFT_TIP1<0.1)|(RIGHT_TIP1<0.1))=1;
                id_tip2_p((LEFT_TIP2<0.1)|(RIGHT_TIP2<0.1))=1;
                id_tip3_p((LEFT_TIP3<0.1)|(RIGHT_TIP3<0.1))=1;
                id_tip4_p((LEFT_TIP4<0.1)|(RIGHT_TIP4<0.1))=1;
        
                id_tl_p(TOP<0.35)=1; % top leaflet
                id_ll_1_p((LEFT_TIP1<0.5)|(RIGHT_TIP1<0.5))=1;  % lateral leaflet 1
                id_ll_2_p((LEFT_TIP2<0.5)|(RIGHT_TIP2<0.5))=1;  % lateral leaflet 2
                id_ll_3_p((LEFT_TIP3<0.5)|(RIGHT_TIP3<0.5))=1;  % lateral leaflet 3
                
                id_add_p((id_tl_p)|(id_ll_1_p)|(id_ll_2_p)|(id_ll_3_p)|(id_ll_4_p))=1;
                id_sinus_p(((abs(m.nodes(:,1))>0.6)&(m.nodes(:,2)<20)&(~id_ll_1_p)&(~id_ll_2_p)&(~id_ll_3_p)&(~id_ll_4_p))|...
                           ((RADII>0.6)&(m.nodes(:,2)>20)&(~id_tl_p)))=1;       
                id_midvein_p((abs(m.nodes(:,1))<0.05)&(m.nodes(:,2)<20))=1;   
                id_rachis_p((~id_sinus_p)&(~id_tl_p)&(~id_ll_4_p)&...
                    (~id_ll_1_p)&(~id_ll_2_p)&(~id_ll_3_p))=1;
            
            case 'MODEL4'
                
                left_tip1 = [-1,  (20-40/39)];
                left_tip2 = [-1,  10];
                left_tip3 = [-1,  0];
                left_tip4 = [-1, -(10+200/39)];
                right_tip1 = [1,  (20-40/39)];
                right_tip2 = [1,  10];
                right_tip3 = [1,  0];
                right_tip4 = [1, -(10+200/39)];
         
                LEFT_TIP1 = sqrt((m.nodes(:,1)-left_tip1(1)).^2+(m.nodes(:,2)-left_tip1(2)).^2);
                LEFT_TIP2 = sqrt((m.nodes(:,1)-left_tip2(1)).^2+(m.nodes(:,2)-left_tip2(2)).^2);
                LEFT_TIP3 = sqrt((m.nodes(:,1)-left_tip3(1)).^2+(m.nodes(:,2)-left_tip3(2)).^2);
                LEFT_TIP4 = sqrt((m.nodes(:,1)-left_tip4(1)).^2+(m.nodes(:,2)-left_tip4(2)).^2);
                RIGHT_TIP1 = sqrt((m.nodes(:,1)-right_tip1(1)).^2+(m.nodes(:,2)-right_tip1(2)).^2);
                RIGHT_TIP2 = sqrt((m.nodes(:,1)-right_tip2(1)).^2+(m.nodes(:,2)-right_tip2(2)).^2);
                RIGHT_TIP3 = sqrt((m.nodes(:,1)-right_tip3(1)).^2+(m.nodes(:,2)-right_tip3(2)).^2);
                RIGHT_TIP4 = sqrt((m.nodes(:,1)-right_tip4(1)).^2+(m.nodes(:,2)-right_tip4(2)).^2);
        
                id_tip1_p((LEFT_TIP1<0.1)|(RIGHT_TIP1<0.1))=1;
                id_tip2_p((LEFT_TIP2<0.1)|(RIGHT_TIP2<0.1))=1;
                id_tip3_p((LEFT_TIP3<0.1)|(RIGHT_TIP3<0.1))=1;
                id_tip4_p((LEFT_TIP4<0.1)|(RIGHT_TIP4<0.1))=1;
        
                id_tl_p(TOP<0.35)=1;   % top tendril
                id_ll_1_p((LEFT_TIP1<0.5)|(RIGHT_TIP1<0.5))=1;  % lateral tendril
                id_ll_2_p((LEFT_TIP2<0.5)|(RIGHT_TIP2<0.5))=1;  % lateral leaflet 1
                id_ll_3_p((LEFT_TIP3<0.5)|(RIGHT_TIP3<0.5))=1;  % lateral leaflet 2
                id_ll_4_p((LEFT_TIP4<0.5)|(RIGHT_TIP4<0.5))=1;  % stipule
                id_add_p((id_tl_p)|(id_ll_1_p)|(id_ll_2_p)|(id_ll_3_p)|(id_ll_4_p))=1; 
        
                id_sinus_p(((abs(m.nodes(:,1))>0.6)&(m.nodes(:,2)<20)&(~id_ll_1_p)&(~id_ll_2_p)&(~id_ll_3_p)&(~id_ll_4_p))|...
                           ((RADII>0.6)&(m.nodes(:,2)>=20)&(~id_tl_p)))=1;
        
                id_midvein_p((abs(m.nodes(:,1))<0.05)&(m.nodes(:,2)<20))=1;
                id_rachis_p((~id_sinus_p)&(~id_tl_p)&(~id_ll_4_p)&...
                            (~id_ll_1_p)&(~id_ll_2_p)&(~id_ll_3_p))=1;
        end
  
        % base of mesh was fixed        
        id_base_p(m.nodes(:,2)==min(m.nodes(:,2)))=1;
        m = leaf_fix_vertex( m, 'vertex', find(id_base_p==1), 'dfs', 'y');  
        
    end
    
    
    % @@ PRN Polarity Regulatory Network
    % Pre-growth stage for generating the polarity field
    
    if (realtime <= 3 - 0.0001)
        
        % The proximodistal polarity field was established by a diffusible morphogen POL
        % genereted from the source and removed at the sink.
        switch OPTIONS.modelname
            
            case 'MODEL1'
                
                P(id_midvein_p == 1) = 1;  % source
                P(id_tip1_p==1) = 0;  % sink
                m.morphogenclamp((id_tip1_p==1)|(id_midvein_p==1), polariser_i) = 1;
                
            
            case 'MODEL2'
                
                P(id_midvein_p == 1) = 1;  % source
                P((id_tip1_p==1)|(id_tip2_p==1)|(id_tip4_p==1)|(id_top_p==1)) = 0;  % sink
                m.morphogenclamp((id_tip1_p==1)|(id_tip4_p==1)|(id_top_p==1)|(id_midvein_p==1), polariser_i) = 1;
            
            case 'MODEL3'
                
                P(id_midvein_p == 1) = 1;  % source
                P((id_tip1_p==1)|(id_tip2_p==1)|(id_tip4_p==1)|(id_top_p==1)) = 0;  % sink
                m.morphogenclamp((id_tip1_p==1)|(id_tip4_p==1)|(id_top_p==1)|(id_midvein_p==1), polariser_i) = 1;
            
            case 'MODEL4'
                
                P(id_midvein_p == 1) = 1;  % source
                P((id_tip1_p==1)|(id_tip2_p==1)|(id_tip3_p==1)|(id_tip4_p==1)|(id_top_p==1)) = 0;  % sink
                m.morphogenclamp((id_tip1_p==1)|(id_tip2_p==1)|...
                                 (id_tip3_p==1)|(id_tip4_p==1)|...
                                 (id_top_p==1)|(id_midvein_p==1), polariser_i) = 1;
        end
        
        
        m = leaf_mgen_conductivity(m, 'POLARISER', 0.1);
        m = leaf_mgen_absorption(m, 'POLARISER', 0.01);
        
    end
    
    % @@ KRN Growth Rate Regulatory Network
    % kapar/kbpar: growth rate paralle to the proximodistal polarity field
    % kaper/kbper: growth rate perpendicular to the proximodistal polarity field
    % knor: growth rate orthogonal to the canvas
    
    if (realtime > 3 - 0.0001) && (realtime <= 20 - 0.0001)
        
        switch OPTIONS.modelname
            
            case 'MODEL1'
                
                kapar_p = (0.01 + 0.3*id_add_p) .* inh(10, id_sinus_p);
                kaper_p = (0.001 + 0.15*id_add_p) .* inh(10, id_sinus_p);
                kbpar_p = kapar_p;
                kbper_p = kaper_p;

        
            case 'MODEL2'
                
                kapar_p = (0.01 + 0.35*id_tl_p + 0.35*id_ll_1_p) .* inh(10, id_sinus_p);
                kaper_p = (0.001 + 0.3*id_tl_p + 0.3*id_ll_1_p) .* inh(10, id_sinus_p);
                kbpar_p = kapar_p;
                kbper_p = kaper_p;

            
            case 'MODEL3'

                kapar_p = (0.01 + 0.38*id_tl_p + 0.35*id_ll_1_p + 0.3*id_ll_2_p + 0.25*id_ll_3_p)...
                          .* inh(10, id_sinus_p);
                kaper_p = (0.001 + 0.35*id_tl_p + 0.3*id_ll_1_p + 0.25*id_ll_2_p + 0.2*id_ll_3_p)...
                          .* inh(10, id_sinus_p);
                kbpar_p = kapar_p;
                kbper_p = kaper_p;
        

            case 'MODEL4'
                
                kapar_p = (0.01 + 0.3*id_tl_p + 0.4*id_ll_1_p + 0.45*id_ll_2_p + 0.35*id_ll_3_p + 0.4*id_ll_4_p)...
                          .* inh(10, id_sinus_p);
                kaper_p = (0.001 + 0.25*id_ll_3_p + 0.3*id_ll_4_p)...
                          .* inh(10, id_sinus_p);
                kbpar_p = kapar_p;
                kbper_p = kaper_p;
  
        end

        knor_p  = 0; 
        karea_p = kapar_p + kaper_p;   
        
    end 
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.
    m.morphogens(:,polariser_i) = P;
    m.morphogens(:,kapar_i) = kapar_p;
    m.morphogens(:,kaper_i) = kaper_p;
    m.morphogens(:,kbpar_i) = kbpar_p;
    m.morphogens(:,kbper_i) = kbper_p;
    m.morphogens(:,knor_i) = knor_p;
    m.morphogens(:,strainret_i) = strainret_p;
    m.morphogens(:,arrest_i) = arrest_p;
    m.morphogens(:,id_rachis_i) = id_rachis_p;
    m.morphogens(:,id_tl_i) = id_tl_p;
    m.morphogens(:,id_stipule_i) = id_stipule_p;
    m.morphogens(:,id_base_i) = id_base_p;
    m.morphogens(:,id_ll_1_i) = id_ll_1_p;
    m.morphogens(:,id_ll_2_i) = id_ll_2_p;
    m.morphogens(:,id_ll_3_i) = id_ll_3_p;
    m.morphogens(:,id_tip1_i) = id_tip1_p;
    m.morphogens(:,id_tip2_i) = id_tip2_p;
    m.morphogens(:,id_tip3_i) = id_tip3_p;
    m.morphogens(:,id_tip4_i) = id_tip4_p;
    m.morphogens(:,id_sinus_i) = id_sinus_p;
    m.morphogens(:,id_add_i) = id_add_p;
    m.morphogens(:,id_top_i) = id_top_p;
    m.morphogens(:,id_midvein_i) = id_midvein_p;
    m.morphogens(:,id_ll_4_i) = id_ll_4_p;
    m.morphogens(:,karea_i) = karea_p;

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

