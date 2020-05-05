# frozen_string_literal: true

# Copyright 2020 Google LLC
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

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/monitoring/v3/metric_service_pb"
require "google/monitoring/v3/metric_service_services_pb"
require "google/cloud/monitoring/v3/metric_service"

class ::Google::Cloud::Monitoring::V3::MetricService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_list_monitored_resource_descriptors
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Monitoring::V3::ListMonitoredResourceDescriptorsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_monitored_resource_descriptors_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_monitored_resource_descriptors, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::ListMonitoredResourceDescriptorsRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_monitored_resource_descriptors_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_monitored_resource_descriptors({ name: name, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_monitored_resource_descriptors name: name, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_monitored_resource_descriptors ::Google::Cloud::Monitoring::V3::ListMonitoredResourceDescriptorsRequest.new(name: name, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_monitored_resource_descriptors({ name: name, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_monitored_resource_descriptors ::Google::Cloud::Monitoring::V3::ListMonitoredResourceDescriptorsRequest.new(name: name, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_monitored_resource_descriptors_client_stub.call_rpc_count
    end
  end

  def test_get_monitored_resource_descriptor
    # Create GRPC objects.
    grpc_response = ::Google::Api::MonitoredResourceDescriptor.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_monitored_resource_descriptor_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_monitored_resource_descriptor, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::GetMonitoredResourceDescriptorRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_monitored_resource_descriptor_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_monitored_resource_descriptor({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_monitored_resource_descriptor name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_monitored_resource_descriptor ::Google::Cloud::Monitoring::V3::GetMonitoredResourceDescriptorRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_monitored_resource_descriptor({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_monitored_resource_descriptor ::Google::Cloud::Monitoring::V3::GetMonitoredResourceDescriptorRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_monitored_resource_descriptor_client_stub.call_rpc_count
    end
  end

  def test_list_metric_descriptors
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Monitoring::V3::ListMetricDescriptorsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_metric_descriptors_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_metric_descriptors, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::ListMetricDescriptorsRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_metric_descriptors_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_metric_descriptors({ name: name, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_metric_descriptors name: name, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_metric_descriptors ::Google::Cloud::Monitoring::V3::ListMetricDescriptorsRequest.new(name: name, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_metric_descriptors({ name: name, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_metric_descriptors ::Google::Cloud::Monitoring::V3::ListMetricDescriptorsRequest.new(name: name, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_metric_descriptors_client_stub.call_rpc_count
    end
  end

  def test_get_metric_descriptor
    # Create GRPC objects.
    grpc_response = ::Google::Api::MetricDescriptor.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_metric_descriptor_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_metric_descriptor, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::GetMetricDescriptorRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_metric_descriptor_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_metric_descriptor({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_metric_descriptor name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_metric_descriptor ::Google::Cloud::Monitoring::V3::GetMetricDescriptorRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_metric_descriptor({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_metric_descriptor ::Google::Cloud::Monitoring::V3::GetMetricDescriptorRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_metric_descriptor_client_stub.call_rpc_count
    end
  end

  def test_create_metric_descriptor
    # Create GRPC objects.
    grpc_response = ::Google::Api::MetricDescriptor.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    metric_descriptor = {}

    create_metric_descriptor_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_metric_descriptor, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::CreateMetricDescriptorRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Api::MetricDescriptor), request.metric_descriptor
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_metric_descriptor_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_metric_descriptor({ name: name, metric_descriptor: metric_descriptor }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_metric_descriptor name: name, metric_descriptor: metric_descriptor do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_metric_descriptor ::Google::Cloud::Monitoring::V3::CreateMetricDescriptorRequest.new(name: name, metric_descriptor: metric_descriptor) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_metric_descriptor({ name: name, metric_descriptor: metric_descriptor }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_metric_descriptor ::Google::Cloud::Monitoring::V3::CreateMetricDescriptorRequest.new(name: name, metric_descriptor: metric_descriptor), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_metric_descriptor_client_stub.call_rpc_count
    end
  end

  def test_delete_metric_descriptor
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_metric_descriptor_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_metric_descriptor, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::DeleteMetricDescriptorRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_metric_descriptor_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_metric_descriptor({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_metric_descriptor name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_metric_descriptor ::Google::Cloud::Monitoring::V3::DeleteMetricDescriptorRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_metric_descriptor({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_metric_descriptor ::Google::Cloud::Monitoring::V3::DeleteMetricDescriptorRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_metric_descriptor_client_stub.call_rpc_count
    end
  end

  def test_list_time_series
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Monitoring::V3::ListTimeSeriesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    filter = "hello world"
    interval = {}
    aggregation = {}
    order_by = "hello world"
    view = :FULL
    page_size = 42
    page_token = "hello world"

    list_time_series_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_time_series, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::ListTimeSeriesRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.filter
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Monitoring::V3::TimeInterval), request.interval
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Monitoring::V3::Aggregation), request.aggregation
      assert_equal "hello world", request.order_by
      assert_equal :FULL, request.view
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_time_series_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_time_series({ name: name, filter: filter, interval: interval, aggregation: aggregation, order_by: order_by, view: view, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_time_series name: name, filter: filter, interval: interval, aggregation: aggregation, order_by: order_by, view: view, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_time_series ::Google::Cloud::Monitoring::V3::ListTimeSeriesRequest.new(name: name, filter: filter, interval: interval, aggregation: aggregation, order_by: order_by, view: view, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_time_series({ name: name, filter: filter, interval: interval, aggregation: aggregation, order_by: order_by, view: view, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_time_series ::Google::Cloud::Monitoring::V3::ListTimeSeriesRequest.new(name: name, filter: filter, interval: interval, aggregation: aggregation, order_by: order_by, view: view, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_time_series_client_stub.call_rpc_count
    end
  end

  def test_create_time_series
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    time_series = [{}]

    create_time_series_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_time_series, name
      assert_kind_of ::Google::Cloud::Monitoring::V3::CreateTimeSeriesRequest, request
      assert_equal "hello world", request.name
      assert_kind_of ::Google::Cloud::Monitoring::V3::TimeSeries, request.time_series.first
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_time_series_client_stub do
      # Create client
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_time_series({ name: name, time_series: time_series }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_time_series name: name, time_series: time_series do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_time_series ::Google::Cloud::Monitoring::V3::CreateTimeSeriesRequest.new(name: name, time_series: time_series) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_time_series({ name: name, time_series: time_series }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_time_series ::Google::Cloud::Monitoring::V3::CreateTimeSeriesRequest.new(name: name, time_series: time_series), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_time_series_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Monitoring::V3::MetricService::Client::Configuration, config
  end
end