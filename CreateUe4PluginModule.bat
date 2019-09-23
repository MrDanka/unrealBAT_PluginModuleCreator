@ECHO off

ECHO Input the name of your module
set /p modulename=
mkdir .\%modulename%
mkdir .\%modulename%\Private
mkdir .\%modulename%\Public


@echo using UnrealBuildTool; >> .\%modulename%\%modulename%.Build.cs
@echo:  >> .\%modulename%\%modulename%.Build.cs
@echo public class %modulename% : ModuleRules >> .\%modulename%\%modulename%.Build.cs
@echo { >> .\%modulename%\%modulename%.Build.cs
@echo	 public %modulename%(ReadOnlyTargetRules Target) : base(Target) >> .\%modulename%\%modulename%.Build.cs
@echo	 { >> .\%modulename%\%modulename%.Build.cs
@echo		 PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs; >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo		 PublicIncludePaths.AddRange( >> .\%modulename%\%modulename%.Build.cs
@echo			 new string[] { >> .\%modulename%\%modulename%.Build.cs
@echo				 // ... add public include paths required here ... >> .\%modulename%\%modulename%.Build.cs
@echo			 } >> .\%modulename%\%modulename%.Build.cs
@echo			 ); >> .\%modulename%\%modulename%.Build.cs
@echo: 				 >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo		 PrivateIncludePaths.AddRange( >> .\%modulename%\%modulename%.Build.cs
@echo			 new string[] { >> .\%modulename%\%modulename%.Build.cs
@echo				 // ... add other private include paths required here ... >> .\%modulename%\%modulename%.Build.cs
@echo				 "%modulename%/Private" >> .\%modulename%\%modulename%.Build.cs
@echo			 } >> .\%modulename%\%modulename%.Build.cs
@echo			 ); >> .\%modulename%\%modulename%.Build.cs
@echo: 			 >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo		 PublicDependencyModuleNames.AddRange( >> .\%modulename%\%modulename%.Build.cs
@echo			 new string[] >> .\%modulename%\%modulename%.Build.cs
@echo			 { >> .\%modulename%\%modulename%.Build.cs
@echo                 "Core", >> .\%modulename%\%modulename%.Build.cs
@echo                 "CoreUObject", >> .\%modulename%\%modulename%.Build.cs
@echo                 "Engine" >> .\%modulename%\%modulename%.Build.cs
@echo				 // ... add other public dependencies that you statically link with here ... >> .\%modulename%\%modulename%.Build.cs
@echo			 } >> .\%modulename%\%modulename%.Build.cs
@echo			 ); >> .\%modulename%\%modulename%.Build.cs
@echo: 			 >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo		 PrivateDependencyModuleNames.AddRange( >> .\%modulename%\%modulename%.Build.cs
@echo			 new string[] >> .\%modulename%\%modulename%.Build.cs
@echo			 { >> .\%modulename%\%modulename%.Build.cs
@echo                 "Slate", >> .\%modulename%\%modulename%.Build.cs
@echo                 "SlateCore", >> .\%modulename%\%modulename%.Build.cs
@echo                 "GameplayTags" >> .\%modulename%\%modulename%.Build.cs
@echo				 // ... add private dependencies that you statically link with here ...	 >> .\%modulename%\%modulename%.Build.cs
@echo			 } >> .\%modulename%\%modulename%.Build.cs
@echo			 ); >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo: 		 >> .\%modulename%\%modulename%.Build.cs
@echo		 DynamicallyLoadedModuleNames.AddRange( >> .\%modulename%\%modulename%.Build.cs
@echo			 new string[] >> .\%modulename%\%modulename%.Build.cs
@echo			 { >> .\%modulename%\%modulename%.Build.cs
@echo				 // ... add any modules that your module loads dynamically here ... >> .\%modulename%\%modulename%.Build.cs
@echo			 } >> .\%modulename%\%modulename%.Build.cs
@echo			 ); >> .\%modulename%\%modulename%.Build.cs
@echo	 } >> .\%modulename%\%modulename%.Build.cs
@echo } >> .\%modulename%\%modulename%.Build.cs

@echo #pragma once>> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h
@echo #include "Modules/ModuleManager.h">> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h
@echo DECLARE_LOG_CATEGORY_EXTERN(%modulename%, Log, All);>> .\%modulename%\Public\I%modulename%.h
@echo /**>> .\%modulename%\Public\I%modulename%.h
@echo  * The public interface to this module.  In most cases, this interface is only public to sibling modules >> .\%modulename%\Public\I%modulename%.h
@echo  * within this plugin.>> .\%modulename%\Public\I%modulename%.h
@echo  */>> .\%modulename%\Public\I%modulename%.h
@echo class I%modulename% : public IModuleInterface>> .\%modulename%\Public\I%modulename%.h
@echo {>> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h
@echo public:>> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h
@echo	 /**>> .\%modulename%\Public\I%modulename%.h
@echo	  * Singleton-like access to this module's interface.  This is just for convenience!>> .\%modulename%\Public\I%modulename%.h
@echo	  * Beware of calling this during the shutdown phase, though.  Your module might have been unloaded already.>> .\%modulename%\Public\I%modulename%.h
@echo	  *>> .\%modulename%\Public\I%modulename%.h
@echo	  * @return Returns singleton instance, loading the module on demand if needed>> .\%modulename%\Public\I%modulename%.h
@echo	  */>> .\%modulename%\Public\I%modulename%.h
@echo 	 static inline I%modulename%^& Get() >> .\%modulename%\Public\I%modulename%.h
@echo	 {>> .\%modulename%\Public\I%modulename%.h
@echo		 return FModuleManager::LoadModuleChecked^< I%modulename% ^>( "%modulename%" ); >> .\%modulename%\Public\I%modulename%.h
@echo	 }>> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h
@echo	 /**>> .\%modulename%\Public\I%modulename%.h
@echo	  * Checks to see if this module is loaded and ready.  It is only valid to call Get() if IsAvailable() returns true.>> .\%modulename%\Public\I%modulename%.h
@echo	  *>> .\%modulename%\Public\I%modulename%.h
@echo	  * @return True if the module is loaded and ready to use>> .\%modulename%\Public\I%modulename%.h
@echo	  */>> .\%modulename%\Public\I%modulename%.h
@echo	 static inline bool IsAvailable() >> .\%modulename%\Public\I%modulename%.h
@echo	 {>> .\%modulename%\Public\I%modulename%.h
@echo		 return FModuleManager::Get().IsModuleLoaded( "%modulename%" ); >> .\%modulename%\Public\I%modulename%.h
@echo	 }>> .\%modulename%\Public\I%modulename%.h
@echo };>> .\%modulename%\Public\I%modulename%.h
@echo: >> .\%modulename%\Public\I%modulename%.h

@echo #include "%modulename%PCH.h">> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo DEFINE_LOG_CATEGORY(%modulename%)>> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo class F%modulename% : public I%modulename%>> .\%modulename%\Private\%modulename%.cpp
@echo {>> .\%modulename%\Private\%modulename%.cpp
@echo 	/** IModuleInterface implementation */>> .\%modulename%\Private\%modulename%.cpp
@echo 	virtual void StartupModule() override;>> .\%modulename%\Private\%modulename%.cpp
@echo 	virtual void ShutdownModule() override;>> .\%modulename%\Private\%modulename%.cpp
@echo };>> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo IMPLEMENT_MODULE( F%modulename%, %modulename% )>> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo void F%modulename%::StartupModule()>> .\%modulename%\Private\%modulename%.cpp
@echo {>> .\%modulename%\Private\%modulename%.cpp
@echo 	// This code will execute after your module is loaded into memory (but after global variables are initialized, of course.)>> .\%modulename%\Private\%modulename%.cpp
@echo }>> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo: >> .\%modulename%\Private\%modulename%.cpp
@echo void F%modulename%::ShutdownModule()>> .\%modulename%\Private\%modulename%.cpp
@echo {>> .\%modulename%\Private\%modulename%.cpp
@echo 	// This function may be called during shutdown to clean up your module.  For modules that support dynamic reloading,>> .\%modulename%\Private\%modulename%.cpp
@echo 	// we call this function before unloading the module.>> .\%modulename%\Private\%modulename%.cpp
@echo }>> .\%modulename%\Private\%modulename%.cpp

@echo #pragma once>> .\%modulename%\Private\%modulename%PCH.h
@echo: >> .\%modulename%\Private\%modulename%PCH.h
@echo // You should place include statements to your module's private header files here.  You only need to>> .\%modulename%\Private\%modulename%PCH.h
@echo // add includes for headers that are used in most of your module's source files though.>> .\%modulename%\Private\%modulename%PCH.h
@echo #include "I%modulename%.h">> .\%modulename%\Private\%modulename%PCH.h
@echo: >> .\%modulename%\Private\%modulename%PCH.h
@echo #define LOG_INFO(FMT, ...) UE_LOG(%modulename%, Display, (FMT), ##__VA_ARGS__)>> .\%modulename%\Private\%modulename%PCH.h
@echo #define LOG_WARNING(FMT, ...) UE_LOG(%modulename%, Warning, (FMT), ##__VA_ARGS__)>> .\%modulename%\Private\%modulename%PCH.h
@echo #define LOG_ERROR(FMT, ...) UE_LOG(%modulename%, Error, (FMT), ##__VA_ARGS__)>> .\%modulename%\Private\%modulename%PCH.h

@echo Module %modulename% succesfully created!
pause