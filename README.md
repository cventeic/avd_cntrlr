# AvdCntrlr

Ruby code to dynamically update android virtual device instance from gpsd

Socket connections are opened to both GPSD and ADB for AVD.

GPSD is configured to send periodic location fixes in json formatted messages.

GPS location is updated via ADB connection when fixes are received from GPSD.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avd_cntrlr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avd_cntrlr

## Usage

1) Start Android Virtual Device (AVD) using Android Emulator:
   .../Android/Sdk/tools/emulator -avd Nexus_7_API_23

2) Start / Verify gpsd daemon is operating and GPS device is connected

3) Start AVD_Controller:
   ruby avd_cntrlr

4) Correct GPS coordinates should be available to Android Apps executing in 
   Android Virtual Device instance


Note:
  So far, were hard coded to use:
    GPSD    - 127.0.0.1:2947
    AVD/ADB - 127.0.0.1:5554


## Contributing

1. Fork it ( https://github.com/[my-github-username]/avd_cntrlr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
