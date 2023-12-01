<?php

namespace ProcessMaker\ScriptRunners;

class PythonRunner extends Base
{
    /**
     * Configure docker with python executor
     *
     * @param string $code
     * @param array $dockerConfig
     *
     * @return array
     */
    public function config($code, array $dockerConfig)
    {
        $dockerConfig['image'] = config('script-runners.python.image');
        $dockerConfig['command'] = '/bin/sh /opt/executor/run.sh';
        $dockerConfig['inputs']['/opt/executor/Script.py'] = $code;

        return $dockerConfig;
    }
}
