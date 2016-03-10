# update_profile_pic

Update your profile pic in a snap :sparkles:

[![Circle CI](https://img.shields.io/circleci/project/dkhamsing/update_profile_pic.svg)](https://circleci.com/gh/dkhamsing/update_profile_pic)

## Setup

```shell
$ git clone https://github.com/dkhamsing/update_profile_pic.git
$ cd update_profile_pic/
$ rake install
```

### Configure

```shell
$ update_profile_pic --create-config
open this url in your browser (sign in and authorize): https://api.twitter.com/oauth/authorize?oauth_token=...
enter pin: ...
wrote config.yaml ✨
```

## Usage  

`update_profile_pic <image file> --config <config file>`

```shell
$ update_profile_pic image.png --config config.yml
updating profile pic with image.png...
updating @dkhamsing...
profile pic updated ✨
```

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
