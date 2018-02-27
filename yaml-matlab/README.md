# [YAMLMatlab](https://code.google.com/archive/p/yamlmatlab/)
This package allows the use of [YAML](http://yaml.org/) files in MATLAB. These can be great for input and output files due to the readability of YAML, and can greatly simplify text-parsing.

## Usage
Copy the entire `yaml-matlab` folder (the one in this directory) to your project's folder.

### Reading YAML files
```
yaml_file = 'file.yml';
yamlStruct = ReadYaml(yaml_file);
```

Output can be accessed via `yamlStruct.[dictionary name here].[variable name here]` (which will vary according to your YAML file's format.

### Writing YAML files
```
WriteYaml('file.yml`, yamlStruct);
```
