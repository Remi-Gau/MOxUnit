function assertTrue(a, message)
    % assert that the input is equal to true
    %
    % assertTrue(a[,msg])
    %
    % Inputs:
    %   a               vector scalar logical that must be true
    %   msg             optional custom message
    %
    % Throws:
    %   'MOxUnit:notLogicalScalar'      a is not a logical scalar
    %   'MOxUnit:notTrue'               a is not true
    %
    % Examples:
    %   assertTrue(true);
    %   %||  % ok
    %
    %   assertTrue(false);
    %
    %   %|| error('input does not evaluate to true');
    %
    %   assertFalse([true,true]);
    %   %|| error('input is not a logical scalar');
    %
    % Notes:
    %   - If a custom message is provided, then any error message is prefixed
    %     by this custom message
    %   - This function attempts to show similar behaviour as in
    %     Steve Eddins' MATLAB xUnit Test Framework (2009-2012)
    %     URL: http://www.mathworks.com/matlabcentral/fileexchange/
    %                           22846-matlab-xunit-test-framework
    %
    % NNO Jan 2014

    if ~isscalar(a) || ~islogical(a)
        whatswrong = 'input is not a logical scalar';
        error_id = 'assertTrue:invalidCondition';
    elseif ~a
        whatswrong = 'input does not evaluate to true';
        error_id = 'assertTrue:falseCondition';
    else
        return
    end

    if isempty(error_id)
        return
    end

    if nargin < 2
        message = '';
    end

    full_message = moxunit_util_input2str(message, whatswrong, a);

    if moxunit_util_platform_is_octave()
        error(error_id, '%s', full_message);
    else
        throwAsCaller(MException(error_id, '%s', full_message));
    end
