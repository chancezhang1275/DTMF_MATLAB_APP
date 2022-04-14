classdef app7_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        GridLayout                    matlab.ui.container.GridLayout
        LeftPanel                     matlab.ui.container.Panel
        GridLayout2                   matlab.ui.container.GridLayout
        GridLayout3                   matlab.ui.container.GridLayout
        Button_1                      matlab.ui.control.Button
        Button_2                      matlab.ui.control.Button
        Button_3                      matlab.ui.control.Button
        Button_A                      matlab.ui.control.Button
        Button_4                      matlab.ui.control.Button
        Button_5                      matlab.ui.control.Button
        Button_6                      matlab.ui.control.Button
        Button_B                      matlab.ui.control.Button
        Button_7                      matlab.ui.control.Button
        Button_8                      matlab.ui.control.Button
        Button_9                      matlab.ui.control.Button
        Button_C                      matlab.ui.control.Button
        Button_star                   matlab.ui.control.Button
        Button_0                      matlab.ui.control.Button
        Button_num                    matlab.ui.control.Button
        Button_D                      matlab.ui.control.Button
        GridLayout5                   matlab.ui.container.GridLayout
        GenerateButton                matlab.ui.control.Button
        ClearButton                   matlab.ui.control.Button
        InputPanel                    matlab.ui.container.Panel
        NumTextAreaLabel              matlab.ui.control.Label
        NumTextArea                   matlab.ui.control.TextArea
        GridLayout4                   matlab.ui.container.GridLayout
        Detection_MethodButtonGroup   matlab.ui.container.ButtonGroup
        FFTButton                     matlab.ui.control.RadioButton
        GoertzelButton                matlab.ui.control.RadioButton
        LPCButton                     matlab.ui.control.RadioButton
        Generation_MethodButtonGroup  matlab.ui.container.ButtonGroup
        sineAddButton                 matlab.ui.control.RadioButton
        DDSButton                     matlab.ui.control.RadioButton
        OscillatorButton              matlab.ui.control.RadioButton
        CenterPanel                   matlab.ui.container.Panel
        GridLayout8                   matlab.ui.container.GridLayout
        DeFre                         matlab.ui.control.UIAxes
        InFre                         matlab.ui.control.UIAxes
        InWave                        matlab.ui.control.UIAxes
        noiseWave                     matlab.ui.control.UIAxes
        RightPanel                    matlab.ui.container.Panel
        GridLayout7                   matlab.ui.container.GridLayout
        GridLayout5_2                 matlab.ui.container.GridLayout
        Received_SignalButton         matlab.ui.control.Button
        DetectButton_2                matlab.ui.control.Button
        OutputPanel                   matlab.ui.container.Panel
        NumEditFieldLabel             matlab.ui.control.Label
        NumEditField                  matlab.ui.control.EditField
        Image_down                    matlab.ui.control.Image
        Image_up                      matlab.ui.control.Image
        HTML                          matlab.ui.control.HTML
        Label_up                      matlab.ui.control.Label
        Label_down                    matlab.ui.control.Label
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
        twoPanelWidth = 768;
    end

    properties (Access = public)
        KEY_TABLE = [...
            '1','2','3','A';...
            '4','5','6','B';...
            '7','8','9','C';...
            '*','0','#','D'];
        ROW = [1209 1336 1477 1633];
        COL = [697 770 852 941];
        LPC_TABLE = [
            1	-0.944741096544293	0.604011817807886	0.294348346371357	0.125786928201279	0.0937811661724497	0.132617968399184	0.169807688049971	0.166216437504487	0.124007624714917	0.0679210248115856	0.0192766315144370	-0.0575014197920458
            1	-0.951991281406973	0.670158306080331	0.213323272452477	0.0339220986269205	0.0601471468579445	0.147316579966274	0.186486272333067	0.151514390122495	0.0773403990040596	0.00756102165814065	-0.0431395319462101	-0.0361508729632595
            1	-0.730813720007341	0.625233198830012	0.191867303422413	0.0396532818148863	0.112792710803979	0.231274660494535	0.261677696688484	0.192277555346201	0.0879464724667435	0.00134731796541623	-0.0691154606546867	0.0301474555130236
            1	-0.940442750741889	0.624229938128580	0.303178534995421	0.137382921488940	0.0983045622009301	0.118879536446426	0.135119059079212	0.116663960883179	0.0702911828107375	0.0205478177524459	-0.0150044837810145	-0.108991653052231
            1	-0.955452723485775	0.690881449571429	0.213289239336664	0.0417588990377682	0.0575119063437872	0.119478967660811	0.135125430864252	0.0890316594077478	0.0171698413252379	-0.0440401478645402	-0.0931811184160646	-0.0553779647740333
            1	-0.766083201626076	0.690395293024620	0.219337540897767	0.0715245548719601	0.143517008242544	0.237815121080816	0.234505192494285	0.144157410185694	0.0414039562063378	-0.0281152848932472	-0.0795563674988393	0.0359442165952850
            1	-0.990802347517053	0.684600222592026	0.288460424088311	0.113754662555203	0.0674863714039027	0.0702732212720027	0.0686982661073814	0.0439419913680010	0.00367754695288491	-0.0386640769180823	-0.0836201606310972	-0.103749690234978
            1	-0.886089742596953	0.724706114744185	0.286232923610703	0.111445749261054	0.104204509688870	0.138963126057523	0.133750077933896	0.0781236924598635	0.00587629823064676	-0.0541263560308093	-0.106657988024103	-0.0231713205409895
            1	-0.858370981513055	0.707421989228153	0.149712329647032	0.0219964386142488	0.0840834870217359	0.139565530701739	0.105657853630358	0.0168349066118421	-0.0547823031915182	-0.0910248443301720	-0.156242233256159	0.0968198664100896
            1	-0.827895310618401	0.721910631836954	0.314228467582691	0.140336772523595	0.0965790430683766	0.0904457825100466	0.0673811763040740	0.0199765834291815	-0.0341551536735108	-0.0871242697306342	-0.160289608545440	0.0240737600745557
            1	-0.793981305642895	0.660092057640515	0.389853589198784	0.231257962160933	0.152278801357429	0.113993741263068	0.0838071656881678	0.0459436573740393	0.000556050504434941	-0.0467849187870142	-0.0962898340144108	-0.0984780313737887
            1	-0.772615531910941	0.822106278732231	0.289542296845440	0.138200831325636	0.182053801868963	0.216184219160132	0.158333050438771	0.0531851110388766	-0.0237114722585686	-0.0525154427855618	-0.0740637321354797	0.0758768888319326
            1	-0.826191268093887	0.772253163308590	0.0328791759799671	-0.0245868566724244	0.204451387436404	0.324233877162131	0.250703966994233	0.114390629639243	0.0375420081778127	0.0232535560251054	-0.00181244979541977	0.0704118873489934
            1	-0.811995537895930	0.777113334278110	0.0474140353032057	-0.00422095245608915	0.205761266750238	0.303141407179584	0.211526832202936	0.0619572183469693	-0.0193007434912164	-0.0240715814609916	-0.0238606858815235	0.0589570174839002
            1	-0.840745512302048	0.800660904011979	0.0235904933321405	-0.00487054282937896	0.183808706702321	0.242642070802851	0.127189734920868	-0.0202970474848486	-0.0771177205908587	-0.0513644380790039	-0.0395271287721682	0.0933211429251933
            1	-0.634142020896244	0.759990534824202	0.192215049571111	0.105896351330379	0.221509590804336	0.259004822515106	0.148265503457432	0.00266036599160629	-0.0599031155160857	-0.0390641923682133	-0.0145482355923292	0.129074467284741
            ]
        % 16*13 Table
        % col responding to the arr in lpc for num 1 2 3 4 5 6 7 8 9 0 # * A B C D
        
        
        
        GENERATION_METHOD;  % OSC, DDS, ADD
        DETECTION_METHOD;   % FFT, GOE, LPC
        FREQUENCY = 8000;
        NUM_DISP = 1024;    % to display the input signal
        NUM_ONE = 320;      % real transmission
        DDS_ROM = [];
        DDS_WORDLEN = 8;    % 2^10 = 1024
        TONE = [];
        TONEPATH = "./tone.wav";
        SNR = 25;           % in dBW, note: for LPC, below 25, it would stop working well
        TONE2DETECT = [];
        ERROR_THRED_FFT = 40;   % Hz
        NUM_GOE = 205;
        NUM_GOE_K = [18,20,22,24,31,34,38,42];  % [ROW COL] /8000 * 205
        LPC_RANK = 12;
        
        
        
        input_num_current = '';
        input_num_all = '';
        num2out = '';
        col = 0;
        row = 0;
    end
    
    methods (Access = private)
        % 设置图片的函数
        % 设置图片的函数 读入GENERATION_METHOD, DETECTION_METHOD, 放图
        
        
        
        % Function 1 for key board: generate signal, display t domain for one input
        function [freq1, freq2] = getFrequency(app, inButton)
            switch inButton
                case '1'
                    freq1 = app.ROW(1,1);
                    freq2 = app.COL(1,1);
                case '2'
                    freq1 = app.ROW(1,2);
                    freq2 = app.COL(1,1);
                case '3'
                    freq1 = app.ROW(1,3);
                    freq2 = app.COL(1,1);
                case 'A'
                    freq1 = app.ROW(1,4);
                    freq2 = app.COL(1,1);
                case '4'
                    freq1 = app.ROW(1,1);
                    freq2 = app.COL(1,2);
                case '5'
                    freq1 = app.ROW(1,2);
                    freq2 = app.COL(1,2);
                case '6'
                    freq1 = app.ROW(1,3);
                    freq2 = app.COL(1,2);
                case 'B'
                    freq1 = app.ROW(1,4);
                    freq2 = app.COL(1,2);
                case '7'
                    freq1 = app.ROW(1,1);
                    freq2 = app.COL(1,3);
                case '8'
                    freq1 = app.ROW(1,2);
                    freq2 = app.COL(1,3);
                case '9'
                    freq1 = app.ROW(1,3);
                    freq2 = app.COL(1,3);
                case 'C'
                    freq1 = app.ROW(1,4);
                    freq2 = app.COL(1,3);
                case '*'
                    freq1 = app.ROW(1,1);
                    freq2 = app.COL(1,4);
                case '0'
                    freq1 = app.ROW(1,2);
                    freq2 = app.COL(1,4);
                case '#'
                    freq1 = app.ROW(1,3);
                    freq2 = app.COL(1,4);
                case 'D'
                    freq1 = app.ROW(1,4);
                    freq2 = app.COL(1,4);
                case ''
                    freq1 = 0;
                    freq2 = 0;
            end
        end
        function [x, y] = inputWaveformDisplay(app, generationmethod, num)
            [freq1, freq2] = getFrequency(app, num);
            switch generationmethod
                case 'OSC'
                    [x, y] = app.OSC(freq1, freq2);
                case 'DDS'
                    [x, y] = app.DDS(freq1, freq2);
                case 'ADD'
                    [x, y] = app.ADD(freq1, freq2);
            end
        end
        function [x, y] = OSC(app, freq1, freq2)
            x = zeros(1,app.NUM_DISP);
            x(1) = 1;
            y1 = filter([0 sin(2*pi*freq1/app.FREQUENCY)], [1 -2*cos(2*pi*freq1/app.FREQUENCY) 1], x);
            y2 = filter([0 sin(2*pi*freq2/app.FREQUENCY)], [1 -2*cos(2*pi*freq2/app.FREQUENCY) 1], x);
            y = y1+y2;
            x = (1:app.NUM_DISP)/app.FREQUENCY;
            plot(app.InWave, x, y);
        end
        function [x, y] = DDS(app, freq1, freq2)
            y1 = app.dds_module(freq1);
            y2 = app.dds_module(freq2);
            
            y = y1 + y2;
            y = [0 y];
            x = [0:app.NUM_DISP]/app.FREQUENCY;
            plot(app.InWave, x, y);
        end
        function [x, y] = ADD(app, freq1, freq2)
            x = [1:app.NUM_DISP]/app.FREQUENCY;
            y = cos(2*pi*freq1./app.FREQUENCY*(1:app.NUM_DISP)) + cos(2*pi*freq2./app.FREQUENCY*(1:app.NUM_DISP));
            plot(app.InWave, x, y);
        end
        function y = dds_module(app, fout)
            addresslen = 2^app.DDS_WORDLEN;
            address = 0:addresslen-1;
            app.DDS_ROM = floor(sin(2*pi*address/addresslen)*2^(addresslen-1)); % sine signal storage
            app.DDS_ROM = app.DDS_ROM/ max(app.DDS_ROM); % 0~1
            
            fmin = app.FREQUENCY/addresslen;
            addressgap = floor(fout/ fmin);
            addressout = (0:app.NUM_DISP-1)*addressgap;
            base_sin = mod(floor(addressout), addresslen);
            
            y = zeros(1, length(base_sin));
            y = app.DDS_ROM(base_sin+1);
        end
        
        % Function 2 for key board: display f domain for one input
        function inputFrequencyDisplay(app, ~, y)
            Y = 2*abs(fft(y)/length(y));
            Y(1) = Y(1)/2;
            Y = Y(1:(length(y)+1)/2);
            f = [1:(length(y)+1)/2]*app.FREQUENCY/length(y);
            plot(app.InFre, f, Y);
        end
        
        % Function 3 for key board: make a sound, store in TONE
        % Note that NUM_DISP is for the f display of the input, NUM_ONE is
        % for simulating the real communication -> ITU standards
        function soundButton(app, y, fs)
            soundsc(y,fs);
            app.TONE=[app.TONE,zeros(1,app.NUM_ONE),y(1:app.NUM_ONE)];
        end
        
        
        
        % Generate Button: sound all, write to wav, display t domain and f
        % domain for all
        function soundAndWrite(app, y, fs)
            soundsc(y,fs);
            audiowrite(string(app.TONEPATH),(y')/2,fs);
        end
        function allDisplay(app, y)
            plot(app.InWave, (1:length(y))/app.FREQUENCY, y);
            
            Y = 2*abs(fft(y)/length(y));
            Y(1) = Y(1)/2;
            Y = Y(1:(length(y)+1)/2);
            f = [1:(length(y)+1)/2]*app.FREQUENCY/length(y);
            plot(app.InFre, f, Y);
        end
        
        
        
        % Function1: Simulate a noise to the wav file
        % Function2, 3: read the wave file, make a sound
        % Function4: show the recieved signal in t domain and f domain
        function noise2Wav(app) % Gauss Noise
            tone = audioread(string(app.TONEPATH));
            tone = (tone')*2;
            tone = awgn(tone, app.SNR, 'measured');
            audiowrite(string(app.TONEPATH),(tone')/2,app.FREQUENCY);
        end
        function readWavandSound(app)
            app.TONE2DETECT = audioread(string(app.TONEPATH));
            app.TONE2DETECT = (app.TONE2DETECT')*2;
            soundsc(app.TONE2DETECT,app.FREQUENCY);
        end
        function recievedDisplay(app, y, fs)
            plot(app.noiseWave, (1:length(y))/app.FREQUENCY, y);
            
            Y = 2*abs(fft(y)/length(y));
            Y(1) = Y(1)/2;
            Y = Y(1:(length(y)+1)/2);
            f = [1:(length(y)+1)/2]*app.FREQUENCY/length(y);
            plot(app.DeFre, f, Y);
        end
        
        
        
        % Detect Button
        % Step1: split the TONE2DETECT
        % Step2: for each y in TONE2DETECT, detect, and display the num
        function detectNum(app, ylist, fs)
            for i=1:2:((length(ylist)+1)/app.NUM_ONE)
                y = ylist(app.NUM_ONE*i:app.NUM_ONE*(i+1));
                detectNumAlgo(app, y, fs);
            end
        end
        
        function detectNumAlgo(app, y, fs)
            switch app.DETECTION_METHOD
                case 'FFT'
                    num = app.FFT(y);
                    numOut(app, num);
                case 'GOE'
                    num = app.GOE(y);
                    numOut(app, num);
                case 'LPC'
                    num = app.LPC(y);
                    numOut(app, num);
            end
        end
        function num = FFT(app, y)
            Y = 2*abs(fft(y)/length(y));
            Y(1) = Y(1)/2;
            Y = Y(1:(length(y)+1)/2);
            f = [1:(length(y)+1)/2]*app.FREQUENCY/length(y);
            [~, locs] = findpeaks(Y,'SortStr','descend', 'MinPeakDistance', 0.2);
            
            freq1=min(f(locs(1)),f(locs(2)));
            freq2=max(f(locs(1)),f(locs(2)));
            num = app.freq2num(freq1, freq2);
        end
        function num = GOE(app, y)
            y = y(1:app.NUM_GOE);
            out_series = abs(goertzel(y,app.NUM_GOE_K+1));
            [~, max_num1] = max(out_series(1:4));
            [~, max_num2] = max(out_series(5:8));
            num = app.KEY_TABLE(max_num1, max_num2);
        end
        function num = LPC(app, y)
            arlist = lpc(y,app.LPC_RANK);
            num = app.arlist2num(arlist);
        end
        function num = freq2num(app, freq1, freq2)
            if freq1>=(app.COL(1,1)-app.ERROR_THRED_FFT) && (freq1<=app.COL(1,1)+app.ERROR_THRED_FFT)
                app.row = 1;
            elseif freq1>=(app.COL(1,2)-app.ERROR_THRED_FFT) && (freq1<=app.COL(1,2)+app.ERROR_THRED_FFT)
                app.row = 2;
            elseif freq1>=(app.COL(1,3)-app.ERROR_THRED_FFT) && (freq1<=app.COL(1,3)+app.ERROR_THRED_FFT)
                app.row = 3;
            elseif freq1>=(app.COL(1,4)-app.ERROR_THRED_FFT) && (freq1<=app.COL(1,4)+app.ERROR_THRED_FFT)
                app.row = 4;
            else
                app.row = 0;
            end
            if freq2>=(app.ROW(1,1)-app.ERROR_THRED_FFT) && (freq2<=app.ROW(1,1)+app.ERROR_THRED_FFT)
                app.col = 1;
            elseif freq2>=(app.ROW(1,2)-app.ERROR_THRED_FFT) && (freq2<=app.ROW(1,2)+app.ERROR_THRED_FFT)
                app.col = 2;
            elseif freq2>=(app.ROW(1,3)-app.ERROR_THRED_FFT) && (freq2<=app.ROW(1,3)+app.ERROR_THRED_FFT)
                app.col = 3;
            elseif freq2>=(app.ROW(1,4)-app.ERROR_THRED_FFT) && (freq2<=app.ROW(1,4)+app.ERROR_THRED_FFT)
                app.col = 4;
            else
                app.col = 0;
            end
            if [app.row app.col] == [0 0]
                num =  'StrongNoise!';
            else
                num = app.KEY_TABLE(app.row,app.col);
            end
        end
        function num = arlist2num(app, arlist)
            distlist = zeros(1,16);
            for i = 1:16
                distlist(i) = dist(app.LPC_TABLE(i,:), arlist');
            end
            [~, min_num] = min(distlist);
            if min_num == 11
                num = '*';
            elseif min_num == 12
                num = '#';
            elseif min_num == 13
                num = 'A';
            elseif min_num == 14
                num = 'B';
            elseif min_num == 15
                num = 'C';
            elseif min_num == 16
                num = 'D';
            else
                num = num2str(min_num);
            end
        end
        
        function numOut(app, num)
            app.num2out = [app.num2out, num];
            app.NumEditField.Value = app.num2out;
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.GENERATION_METHOD = 'ADD';
            app.DETECTION_METHOD = 'FFT';
            app.TONE = [];
            
            app.input_num_current = '';
            app.input_num_all = '';
            app.NumTextArea.Value = '';
            app.Image_up.ImageSource = './ADD.png';
            app.Image_down.ImageSource = './FFT.png';
        end

        % Selection changed function: Generation_MethodButtonGroup
        function Generation_MethodButtonGroupSelectionChanged(app, event)
            selectedButton = app.Generation_MethodButtonGroup.SelectedObject;
            switch selectedButton
                case app.OscillatorButton
                    app.GENERATION_METHOD = 'OSC';
                    app.Image_up.ImageSource = './OSC.png';
                case app.DDSButton
                    app.GENERATION_METHOD = 'DDS';
                    app.Image_up.ImageSource = './DDS.png';
                case app.sineAddButton
                    app.GENERATION_METHOD = 'ADD';
                    app.Image_up.ImageSource = './ADD.png';
            end
            
            app.TONE = [];
            app.input_num_current = '';
            app.input_num_all = '';
            app.DDS_ROM = [];
            app.NumTextArea.Value = app.input_num_all;
            app.NumEditField.Value = '';
            plot(app.InWave, 0, 0)
            plot(app.InFre, 0, 0)
            plot(app.noiseWave, 0, 0)
            plot(app.DeFre, 0, 0)
            % 设置图片
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 3x1 grid
                app.GridLayout.RowHeight = {740, 740, 740};
                app.GridLayout.ColumnWidth = {'1x'};
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = 1;
                app.LeftPanel.Layout.Row = 2;
                app.LeftPanel.Layout.Column = 1;
                app.RightPanel.Layout.Row = 3;
                app.RightPanel.Layout.Column = 1;
            elseif (currentFigureWidth > app.onePanelWidth && currentFigureWidth <= app.twoPanelWidth)
                % Change to a 2x2 grid
                app.GridLayout.RowHeight = {740, 740};
                app.GridLayout.ColumnWidth = {'1x', '1x'};
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = [1,2];
                app.LeftPanel.Layout.Row = 2;
                app.LeftPanel.Layout.Column = 1;
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 2;
            else
                % Change to a 1x3 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {268, '1x', 416};
                app.LeftPanel.Layout.Row = 1;
                app.LeftPanel.Layout.Column = 1;
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = 2;
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 3;
            end
        end

        % Selection changed function: Detection_MethodButtonGroup
        function Detection_MethodButtonGroupSelectionChanged(app, event)
            selectedButton = app.Detection_MethodButtonGroup.SelectedObject;
            switch selectedButton
                case app.FFTButton
                    app.DETECTION_METHOD = 'FFT';
                    app.Image_down.ImageSource = './FFT.png';
                case app.GoertzelButton
                    app.DETECTION_METHOD = 'GOE';
                     app.Image_down.ImageSource = './GOE.png';
                case app.LPCButton
                    app.DETECTION_METHOD = 'LPC';
                     app.Image_down.ImageSource = './LPC.png';
            end
            
            app.TONE = [];
            app.input_num_current = '';
            app.input_num_all = '';
            app.DDS_ROM = [];
            app.NumTextArea.Value = app.input_num_all;
            app.NumEditField.Value = '';
            plot(app.InWave, 0, 0)
            plot(app.InFre, 0, 0)
            plot(app.noiseWave, 0, 0)
            plot(app.DeFre, 0, 0)
        end

        % Button pushed function: Button_1
        function Button_1Pushed(app, event)
            % get current
            app.input_num_current = '1';
            % store num
            app.input_num_all = [app.input_num_all, app.input_num_current];
            % display num
            app.NumTextArea.Value = app.input_num_all;
            % display signal t domain
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            % display signal f domain
            inputFrequencyDisplay(app, x, y);
            % sound the num, store in TONE
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            app.input_num_current = '2';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_3
        function Button_3Pushed(app, event)
            app.input_num_current = '3';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_4
        function Button_4Pushed(app, event)
            app.input_num_current = '4';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            app.input_num_current = '5';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            app.input_num_current = '6';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            app.input_num_current = '7';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            app.input_num_current = '8';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_9
        function Button_9Pushed(app, event)
            app.input_num_current = '9';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_C
        function Button_CPushed(app, event)
            app.input_num_current = 'C';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_star
        function Button_starPushed(app, event)
            app.input_num_current = '*';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_0
        function Button_0Pushed(app, event)
            app.input_num_current = '0';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_num
        function Button_numPushed(app, event)
            app.input_num_current = '#';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_D
        function Button_DPushed(app, event)
            app.input_num_current = 'D';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_A
        function Button_APushed(app, event)
            app.input_num_current = 'A';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: Button_B
        function Button_BPushed(app, event)
            app.input_num_current = 'B';
            app.input_num_all = [app.input_num_all, app.input_num_current];
            app.NumTextArea.Value = app.input_num_all;
            [x, y] = inputWaveformDisplay(app, app.GENERATION_METHOD, app.input_num_current);
            inputFrequencyDisplay(app, x, y);
            app.soundButton(y, app.FREQUENCY);
        end

        % Button pushed function: GenerateButton
        function GenerateButtonPushed(app, event)
            app.soundAndWrite(app.TONE, app.FREQUENCY);
            app.allDisplay(app.TONE)
        end

        % Button pushed function: ClearButton
        function ClearButtonPushed(app, event)
            % Clear的函数
            app.input_num_current = '';
            app.input_num_all = '';
            app.NumTextArea.Value = app.input_num_all;
            app.TONE = [];
            app.num2out = '';
            app.NumEditField.Value = app.num2out;
            plot(app.InWave, 0, 0)
            plot(app.InFre, 0, 0)
            plot(app.noiseWave, 0, 0)
            plot(app.DeFre, 0, 0)
        end

        % Button pushed function: Received_SignalButton
        function Received_SignalButtonPushed(app, event)
            app.noise2Wav();
            app.readWavandSound();
            app.recievedDisplay(app.TONE2DETECT, app.FREQUENCY);
        end

        % Button pushed function: DetectButton_2
        function DetectButton_2Pushed(app, event)
            app.detectNum(app.TONE2DETECT, app.FREQUENCY);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1321 740];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {268, '1x', 416};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.LeftPanel);
            app.GridLayout2.ColumnWidth = {'1x'};
            app.GridLayout2.RowHeight = {'1x', '1x', '1x'};

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.GridLayout2);
            app.GridLayout3.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.GridLayout3.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout3.Layout.Row = 3;
            app.GridLayout3.Layout.Column = 1;

            % Create Button_1
            app.Button_1 = uibutton(app.GridLayout3, 'push');
            app.Button_1.ButtonPushedFcn = createCallbackFcn(app, @Button_1Pushed, true);
            app.Button_1.Layout.Row = 1;
            app.Button_1.Layout.Column = 1;
            app.Button_1.Text = '1';

            % Create Button_2
            app.Button_2 = uibutton(app.GridLayout3, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.Layout.Row = 1;
            app.Button_2.Layout.Column = 2;
            app.Button_2.Text = '2';

            % Create Button_3
            app.Button_3 = uibutton(app.GridLayout3, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @Button_3Pushed, true);
            app.Button_3.Layout.Row = 1;
            app.Button_3.Layout.Column = 3;
            app.Button_3.Text = '3';

            % Create Button_A
            app.Button_A = uibutton(app.GridLayout3, 'push');
            app.Button_A.ButtonPushedFcn = createCallbackFcn(app, @Button_APushed, true);
            app.Button_A.Layout.Row = 1;
            app.Button_A.Layout.Column = 4;
            app.Button_A.Text = 'A';

            % Create Button_4
            app.Button_4 = uibutton(app.GridLayout3, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Button_4.Layout.Row = 2;
            app.Button_4.Layout.Column = 1;
            app.Button_4.Text = '4';

            % Create Button_5
            app.Button_5 = uibutton(app.GridLayout3, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.Layout.Row = 2;
            app.Button_5.Layout.Column = 2;
            app.Button_5.Text = '5';

            % Create Button_6
            app.Button_6 = uibutton(app.GridLayout3, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.Layout.Row = 2;
            app.Button_6.Layout.Column = 3;
            app.Button_6.Text = '6';

            % Create Button_B
            app.Button_B = uibutton(app.GridLayout3, 'push');
            app.Button_B.ButtonPushedFcn = createCallbackFcn(app, @Button_BPushed, true);
            app.Button_B.Layout.Row = 2;
            app.Button_B.Layout.Column = 4;
            app.Button_B.Text = 'B';

            % Create Button_7
            app.Button_7 = uibutton(app.GridLayout3, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.Layout.Row = 3;
            app.Button_7.Layout.Column = 1;
            app.Button_7.Text = '7';

            % Create Button_8
            app.Button_8 = uibutton(app.GridLayout3, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.Layout.Row = 3;
            app.Button_8.Layout.Column = 2;
            app.Button_8.Text = '8';

            % Create Button_9
            app.Button_9 = uibutton(app.GridLayout3, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Button_9.Layout.Row = 3;
            app.Button_9.Layout.Column = 3;
            app.Button_9.Text = '9';

            % Create Button_C
            app.Button_C = uibutton(app.GridLayout3, 'push');
            app.Button_C.ButtonPushedFcn = createCallbackFcn(app, @Button_CPushed, true);
            app.Button_C.Layout.Row = 3;
            app.Button_C.Layout.Column = 4;
            app.Button_C.Text = 'C';

            % Create Button_star
            app.Button_star = uibutton(app.GridLayout3, 'push');
            app.Button_star.ButtonPushedFcn = createCallbackFcn(app, @Button_starPushed, true);
            app.Button_star.Layout.Row = 4;
            app.Button_star.Layout.Column = 1;
            app.Button_star.Text = '*';

            % Create Button_0
            app.Button_0 = uibutton(app.GridLayout3, 'push');
            app.Button_0.ButtonPushedFcn = createCallbackFcn(app, @Button_0Pushed, true);
            app.Button_0.Layout.Row = 4;
            app.Button_0.Layout.Column = 2;
            app.Button_0.Text = '0';

            % Create Button_num
            app.Button_num = uibutton(app.GridLayout3, 'push');
            app.Button_num.ButtonPushedFcn = createCallbackFcn(app, @Button_numPushed, true);
            app.Button_num.Layout.Row = 4;
            app.Button_num.Layout.Column = 3;
            app.Button_num.Text = '#';

            % Create Button_D
            app.Button_D = uibutton(app.GridLayout3, 'push');
            app.Button_D.ButtonPushedFcn = createCallbackFcn(app, @Button_DPushed, true);
            app.Button_D.Layout.Row = 4;
            app.Button_D.Layout.Column = 4;
            app.Button_D.Text = 'D';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.GridLayout2);
            app.GridLayout5.ColumnWidth = {'1x'};
            app.GridLayout5.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout5.Layout.Row = 2;
            app.GridLayout5.Layout.Column = 1;

            % Create GenerateButton
            app.GenerateButton = uibutton(app.GridLayout5, 'push');
            app.GenerateButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateButtonPushed, true);
            app.GenerateButton.Layout.Row = 2;
            app.GenerateButton.Layout.Column = 1;
            app.GenerateButton.Text = 'Generate';

            % Create ClearButton
            app.ClearButton = uibutton(app.GridLayout5, 'push');
            app.ClearButton.ButtonPushedFcn = createCallbackFcn(app, @ClearButtonPushed, true);
            app.ClearButton.Layout.Row = 3;
            app.ClearButton.Layout.Column = 1;
            app.ClearButton.Text = 'Clear';

            % Create InputPanel
            app.InputPanel = uipanel(app.GridLayout5);
            app.InputPanel.TitlePosition = 'centertop';
            app.InputPanel.Title = 'Input';
            app.InputPanel.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);
            app.InputPanel.Layout.Row = 1;
            app.InputPanel.Layout.Column = 1;

            % Create NumTextAreaLabel
            app.NumTextAreaLabel = uilabel(app.InputPanel);
            app.NumTextAreaLabel.HorizontalAlignment = 'right';
            app.NumTextAreaLabel.Position = [30 13 31 22];
            app.NumTextAreaLabel.Text = 'Num';

            % Create NumTextArea
            app.NumTextArea = uitextarea(app.InputPanel);
            app.NumTextArea.Position = [75 10 138 26];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.GridLayout2);
            app.GridLayout4.ColumnWidth = {'1x'};
            app.GridLayout4.Layout.Row = 1;
            app.GridLayout4.Layout.Column = 1;

            % Create Detection_MethodButtonGroup
            app.Detection_MethodButtonGroup = uibuttongroup(app.GridLayout4);
            app.Detection_MethodButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @Detection_MethodButtonGroupSelectionChanged, true);
            app.Detection_MethodButtonGroup.TitlePosition = 'centertop';
            app.Detection_MethodButtonGroup.Title = 'Detection_Method';
            app.Detection_MethodButtonGroup.Layout.Row = 2;
            app.Detection_MethodButtonGroup.Layout.Column = 1;

            % Create FFTButton
            app.FFTButton = uiradiobutton(app.Detection_MethodButtonGroup);
            app.FFTButton.Text = 'FFT';
            app.FFTButton.Position = [16 47 44 22];
            app.FFTButton.Value = true;

            % Create GoertzelButton
            app.GoertzelButton = uiradiobutton(app.Detection_MethodButtonGroup);
            app.GoertzelButton.Text = 'Goertzel';
            app.GoertzelButton.Position = [107 47 67 22];

            % Create LPCButton
            app.LPCButton = uiradiobutton(app.Detection_MethodButtonGroup);
            app.LPCButton.Text = 'LPC';
            app.LPCButton.Position = [16 19 65 22];

            % Create Generation_MethodButtonGroup
            app.Generation_MethodButtonGroup = uibuttongroup(app.GridLayout4);
            app.Generation_MethodButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @Generation_MethodButtonGroupSelectionChanged, true);
            app.Generation_MethodButtonGroup.TitlePosition = 'centertop';
            app.Generation_MethodButtonGroup.Title = 'Generation_Method';
            app.Generation_MethodButtonGroup.Layout.Row = 1;
            app.Generation_MethodButtonGroup.Layout.Column = 1;

            % Create sineAddButton
            app.sineAddButton = uiradiobutton(app.Generation_MethodButtonGroup);
            app.sineAddButton.Text = 'sineAdd';
            app.sineAddButton.Position = [16 47 65 22];
            app.sineAddButton.Value = true;

            % Create DDSButton
            app.DDSButton = uiradiobutton(app.Generation_MethodButtonGroup);
            app.DDSButton.Text = 'DDS';
            app.DDSButton.Position = [107 46 65 22];

            % Create OscillatorButton
            app.OscillatorButton = uiradiobutton(app.Generation_MethodButtonGroup);
            app.OscillatorButton.Text = 'Oscillator';
            app.OscillatorButton.Position = [16 25 72 22];

            % Create CenterPanel
            app.CenterPanel = uipanel(app.GridLayout);
            app.CenterPanel.Layout.Row = 1;
            app.CenterPanel.Layout.Column = 2;

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.CenterPanel);
            app.GridLayout8.ColumnWidth = {'1x'};
            app.GridLayout8.RowHeight = {'1x', '1x', '1x', '1x'};

            % Create DeFre
            app.DeFre = uiaxes(app.GridLayout8);
            title(app.DeFre, 'Recieved Signal Frequency')
            xlabel(app.DeFre, 'f(Hz)')
            ylabel(app.DeFre, 'Amplitude')
            zlabel(app.DeFre, 'Z')
            app.DeFre.PlotBoxAspectRatio = [4.51219512195122 1 1];
            app.DeFre.XLim = [500 2000];
            app.DeFre.XTick = [500 1000 1500 2000];
            app.DeFre.YTick = [0 0.2 0.4 0.6 0.8 1];
            app.DeFre.Layout.Row = 4;
            app.DeFre.Layout.Column = 1;

            % Create InFre
            app.InFre = uiaxes(app.GridLayout8);
            title(app.InFre, 'Generated Frequency')
            xlabel(app.InFre, 'f(Hz)')
            ylabel(app.InFre, 'Amplitude')
            zlabel(app.InFre, 'Z')
            app.InFre.XLim = [500 2000];
            app.InFre.YTick = [0 0.2 0.4 0.6 0.8 1];
            app.InFre.Layout.Row = 2;
            app.InFre.Layout.Column = 1;

            % Create InWave
            app.InWave = uiaxes(app.GridLayout8);
            title(app.InWave, 'Generated Waveform')
            xlabel(app.InWave, 't(s)')
            ylabel(app.InWave, 'Amplitude')
            zlabel(app.InWave, 'Z')
            app.InWave.Layout.Row = 1;
            app.InWave.Layout.Column = 1;

            % Create noiseWave
            app.noiseWave = uiaxes(app.GridLayout8);
            title(app.noiseWave, 'Recieved Wavedform Influenced by Noise')
            xlabel(app.noiseWave, 't(s)')
            ylabel(app.noiseWave, 'Amplitude')
            zlabel(app.noiseWave, 'Z')
            app.noiseWave.Layout.Row = 3;
            app.noiseWave.Layout.Column = 1;

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 3;

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.RightPanel);
            app.GridLayout7.ColumnWidth = {'1x'};
            app.GridLayout7.RowHeight = {'0x', '1x', '1x', '1x'};

            % Create GridLayout5_2
            app.GridLayout5_2 = uigridlayout(app.GridLayout7);
            app.GridLayout5_2.ColumnWidth = {'1x'};
            app.GridLayout5_2.RowHeight = {'1x', '1x', '1x'};
            app.GridLayout5_2.Layout.Row = 4;
            app.GridLayout5_2.Layout.Column = 1;

            % Create Received_SignalButton
            app.Received_SignalButton = uibutton(app.GridLayout5_2, 'push');
            app.Received_SignalButton.ButtonPushedFcn = createCallbackFcn(app, @Received_SignalButtonPushed, true);
            app.Received_SignalButton.Layout.Row = 1;
            app.Received_SignalButton.Layout.Column = 1;
            app.Received_SignalButton.Text = 'Received_Signal';

            % Create DetectButton_2
            app.DetectButton_2 = uibutton(app.GridLayout5_2, 'push');
            app.DetectButton_2.ButtonPushedFcn = createCallbackFcn(app, @DetectButton_2Pushed, true);
            app.DetectButton_2.Layout.Row = 2;
            app.DetectButton_2.Layout.Column = 1;
            app.DetectButton_2.Text = 'Detect';

            % Create OutputPanel
            app.OutputPanel = uipanel(app.GridLayout5_2);
            app.OutputPanel.TitlePosition = 'centertop';
            app.OutputPanel.Title = 'Output';
            app.OutputPanel.Layout.Row = 3;
            app.OutputPanel.Layout.Column = 1;

            % Create NumEditFieldLabel
            app.NumEditFieldLabel = uilabel(app.OutputPanel);
            app.NumEditFieldLabel.HorizontalAlignment = 'right';
            app.NumEditFieldLabel.Position = [46 16 46 22];
            app.NumEditFieldLabel.Text = 'Num';

            % Create NumEditField
            app.NumEditField = uieditfield(app.OutputPanel, 'text');
            app.NumEditField.Position = [107 16 212 22];

            % Create Image_down
            app.Image_down = uiimage(app.GridLayout7);
            app.Image_down.Layout.Row = 3;
            app.Image_down.Layout.Column = 1;

            % Create Image_up
            app.Image_up = uiimage(app.GridLayout7);
            app.Image_up.Layout.Row = 2;
            app.Image_up.Layout.Column = 1;

            % Create HTML
            app.HTML = uihtml(app.GridLayout7);
            app.HTML.Layout.Row = 1;
            app.HTML.Layout.Column = 1;

            % Create Label_up
            app.Label_up = uilabel(app.GridLayout7);
            app.Label_up.HorizontalAlignment = 'center';
            app.Label_up.VerticalAlignment = 'bottom';
            app.Label_up.FontSize = 30;
            app.Label_up.Layout.Row = 2;
            app.Label_up.Layout.Column = 1;
            app.Label_up.Text = 'Generation_Method';

            % Create Label_down
            app.Label_down = uilabel(app.GridLayout7);
            app.Label_down.HorizontalAlignment = 'center';
            app.Label_down.VerticalAlignment = 'bottom';
            app.Label_down.FontSize = 30;
            app.Label_down.Layout.Row = 3;
            app.Label_down.Layout.Column = 1;
            app.Label_down.Text = 'Detection_Method';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app7_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end