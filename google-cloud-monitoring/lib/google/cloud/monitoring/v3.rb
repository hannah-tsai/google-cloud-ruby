# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "google/cloud/monitoring/v3/alert_policy_service_client"
require "google/cloud/monitoring/v3/group_service_client"
require "google/cloud/monitoring/v3/metric_service_client"
require "google/cloud/monitoring/v3/notification_channel_service_client"
require "google/cloud/monitoring/v3/service_monitoring_service_client"
require "google/cloud/monitoring/v3/uptime_check_service_client"
require "google/monitoring/v3/span_context_pb"
require "google/monitoring/v3/dropped_labels_pb"

module Google
  module Cloud
    module Monitoring
      # rubocop:disable LineLength

      ##
      # # Ruby Client for Stackdriver Monitoring API ([Beta](https://github.com/googleapis/google-cloud-ruby#versioning))
      #
      # [Stackdriver Monitoring API][Product Documentation]:
      # Manages your Stackdriver Monitoring data and configurations. Most projects
      # must be associated with a Stackdriver account, with a few exceptions as
      # noted on the individual method pages. The table entries below are
      # presented in alphabetical order, not in order of common use. For
      # explanations of the concepts found in the table entries, read the
      # [Stackdriver Monitoring documentation](/monitoring/docs).
      # - [Product Documentation][]
      #
      # ## Quick Start
      # In order to use this library, you first need to go through the following
      # steps:
      #
      # 1. [Select or create a Cloud Platform project.](https://console.cloud.google.com/project)
      # 2. [Enable billing for your project.](https://cloud.google.com/billing/docs/how-to/modify-project#enable_billing_for_a_project)
      # 3. [Enable the Stackdriver Monitoring API.](https://console.cloud.google.com/apis/library/monitoring.googleapis.com)
      # 4. [Setup Authentication.](https://googleapis.dev/ruby/google-cloud-monitoring/latest/file.AUTHENTICATION.html)
      #
      # ### Installation
      # ```
      # $ gem install google-cloud-monitoring
      # ```
      #
      # ### Preview
      # #### MetricServiceClient
      # ```rb
      # require "google/cloud/monitoring"
      #
      # metric_client = Google::Cloud::Monitoring::Metric.new(version: :v3)
      # formatted_name = Google::Cloud::Monitoring::V3::MetricServiceClient.project_path(project_id)
      #
      # # Iterate over all results.
      # metric_client.list_monitored_resource_descriptors(formatted_name).each do |element|
      #   # Process element.
      # end
      #
      # # Or iterate over results one page at a time.
      # metric_client.list_monitored_resource_descriptors(formatted_name).each_page do |page|
      #   # Process each page at a time.
      #   page.each do |element|
      #     # Process element.
      #   end
      # end
      # ```
      #
      # ### Next Steps
      # - Read the [Stackdriver Monitoring API Product documentation][Product Documentation]
      #   to learn more about the product and see How-to Guides.
      # - View this [repository's main README](https://github.com/googleapis/google-cloud-ruby/blob/master/README.md)
      #   to see the full list of Cloud APIs that we cover.
      #
      # [Product Documentation]: https://cloud.google.com/monitoring
      #
      # ## Enabling Logging
      #
      # To enable logging for this library, set the logger for the underlying [gRPC](https://github.com/grpc/grpc/tree/master/src/ruby) library.
      # The logger that you set may be a Ruby stdlib [`Logger`](https://ruby-doc.org/stdlib-2.5.0/libdoc/logger/rdoc/Logger.html) as shown below,
      # or a [`Google::Cloud::Logging::Logger`](https://googleapis.dev/ruby/google-cloud-logging/latest)
      # that will write logs to [Stackdriver Logging](https://cloud.google.com/logging/). See [grpc/logconfig.rb](https://github.com/grpc/grpc/blob/master/src/ruby/lib/grpc/logconfig.rb)
      # and the gRPC [spec_helper.rb](https://github.com/grpc/grpc/blob/master/src/ruby/spec/spec_helper.rb) for additional information.
      #
      # Configuring a Ruby stdlib logger:
      #
      # ```ruby
      # require "logger"
      #
      # module MyLogger
      #   LOGGER = Logger.new $stderr, level: Logger::WARN
      #   def logger
      #     LOGGER
      #   end
      # end
      #
      # # Define a gRPC module-level logger method before grpc/logconfig.rb loads.
      # module GRPC
      #   extend MyLogger
      # end
      # ```
      #
      module V3
        # rubocop:enable LineLength

        module AlertPolicy
          ##
          # The AlertPolicyService API is used to manage (list, create, delete,
          # edit) alert policies in Stackdriver Monitoring. An alerting policy is
          # a description of the conditions under which some aspect of your
          # system is considered to be "unhealthy" and the ways to notify
          # people or services about this state. In addition to using this API, alert
          # policies can also be managed through
          # [Stackdriver Monitoring](https://cloud.google.com/monitoring/docs/),
          # which can be reached by clicking the "Monitoring" tab in
          # [Cloud Console](https://console.cloud.google.com/).
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::AlertPolicyServiceClient.new(**kwargs)
          end
        end

        module Group
          ##
          # The Group API lets you inspect and manage your
          # [groups](https://cloud.google.com#google.monitoring.v3.Group).
          #
          # A group is a named filter that is used to identify
          # a collection of monitored resources. Groups are typically used to
          # mirror the physical and/or logical topology of the environment.
          # Because group membership is computed dynamically, monitored
          # resources that are started in the future are automatically placed
          # in matching groups. By using a group to name monitored resources in,
          # for example, an alert policy, the target of that alert policy is
          # updated automatically as monitored resources are added and removed
          # from the infrastructure.
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::GroupServiceClient.new(**kwargs)
          end
        end

        module Metric
          ##
          # Manages metric descriptors, monitored resource descriptors, and
          # time series data.
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::MetricServiceClient.new(**kwargs)
          end
        end

        module NotificationChannel
          ##
          # The Notification Channel API provides access to configuration that
          # controls how messages related to incidents are sent.
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::NotificationChannelServiceClient.new(**kwargs)
          end
        end

        module ServiceMonitoring
          ##
          # The Stackdriver Monitoring Service-Oriented Monitoring API has endpoints for
          # managing and querying aspects of a workspace's services. These include the
          # `Service`'s monitored resources, its Service-Level Objectives, and a taxonomy
          # of categorized Health Metrics.
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::ServiceMonitoringServiceClient.new(**kwargs)
          end
        end

        module UptimeCheck
          ##
          # The UptimeCheckService API is used to manage (list, create, delete, edit)
          # Uptime check configurations in the Stackdriver Monitoring product. An Uptime
          # check is a piece of configuration that determines which resources and
          # services to monitor for availability. These configurations can also be
          # configured interactively by navigating to the [Cloud Console]
          # (http://console.cloud.google.com), selecting the appropriate project,
          # clicking on "Monitoring" on the left-hand side to navigate to Stackdriver,
          # and then clicking on "Uptime".
          #
          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def self.new \
              credentials: nil,
              scopes: nil,
              client_config: nil,
              timeout: nil,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: nil
            kwargs = {
              credentials: credentials,
              scopes: scopes,
              client_config: client_config,
              timeout: timeout,
              metadata: metadata,
              exception_transformer: exception_transformer,
              lib_name: lib_name,
              service_address: service_address,
              service_port: service_port,
              lib_version: lib_version
            }.select { |_, v| v != nil }
            Google::Cloud::Monitoring::V3::UptimeCheckServiceClient.new(**kwargs)
          end
        end
      end
    end
  end
end
