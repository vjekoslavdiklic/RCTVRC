classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    properties (Constant)
        motor_sc_LED_controll = 'motor_sc/LED_controll'
        motor_sc_g_sens = 'motor_sc/g_sens'
        motor_sc_mcnt_msg = 'motor_sc/mcnt_msg'
        motor_sc_minf_msg = 'motor_sc/minf_msg'
        motor_sc_motors_drive = 'motor_sc/motors_drive'
        motor_sc_motors_feedback = 'motor_sc/motors_feedback'
        motor_sc_sens9ax = 'motor_sc/sens9ax'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(7, 1);
                msgList{1} = 'motor_sc/LED_controll';
                msgList{2} = 'motor_sc/g_sens';
                msgList{3} = 'motor_sc/mcnt_msg';
                msgList{4} = 'motor_sc/minf_msg';
                msgList{5} = 'motor_sc/motors_drive';
                msgList{6} = 'motor_sc/motors_feedback';
                msgList{7} = 'motor_sc/sens9ax';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
