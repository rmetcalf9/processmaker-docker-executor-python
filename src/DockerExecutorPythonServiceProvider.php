<?php

namespace ProcessMaker\Package\DockerExecutorPython;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\ServiceProvider;
use ProcessMaker\Models\ScriptExecutor;
use ProcessMaker\Package\DockerExecutorPython\Listeners\PackageListener;
use ProcessMaker\Package\Packages\Events\PackageEvent;
use ProcessMaker\Traits\PluginServiceProviderTrait;

class DockerExecutorPythonServiceProvider extends ServiceProvider
{
    use PluginServiceProviderTrait;

    const version = '1.1.6'; // Required for PluginServiceProviderTrait

    public function register()
    {
    }

    /**
     * After all service provider's register methods have been called, your boot method
     * will be called. You can perform any initialization code that is dependent on
     * other service providers at this time.  We've included some example behavior
     * to get you started.
     *
     * See: https://laravel.com/docs/5.6/providers#the-boot-method
     */
    public function boot()
    {
        Artisan::command('processmaker-docker-executor-python:install', function () {
            ScriptExecutor::install([
                'language' => 'python',
                'title' => 'Python Executor',
                'description' => 'Default Python Executor',
            ]);

            // Build the instance image. This is the same as if you were to build it from the admin UI
            Artisan::call('processmaker:build-script-executor python');

            // Restart the workers so they know about the new supported language
            Artisan::call('horizon:terminate');
        });

        config(['script-runners.python' => [
            'name' => 'Python',
            'mime_type' => 'application/x-python-code',
            'package_path' => __DIR__ . '/..',
            'package_version' => self::version,
            'runner' => 'PythonRunner',
            'options' => [
                'invokerPackage' => 'ProcessMaker_Client',
                'modelPackage' => 'ProcessMaker_Model',
                'apiPackage' => 'ProcessMaker_Api',
            ],
            'init_dockerfile' => [
                'WORKDIR /opt/executor',
            ],
        ]]);

        $this->app['events']->listen(PackageEvent::class, PackageListener::class);

        // Complete the plugin booting
        $this->completePluginBoot();
    }
}
