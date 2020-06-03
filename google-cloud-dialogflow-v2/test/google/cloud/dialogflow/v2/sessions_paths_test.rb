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

require "helper"

require "gapic/grpc/service_stub"

require "google/cloud/dialogflow/v2/sessions"

class ::Google::Cloud::Dialogflow::V2::Sessions::ClientPathsTest < Minitest::Test
  def test_context_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Dialogflow::V2::Sessions::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.context_path project: "value0", session: "value1", context: "value2"
      assert_equal "projects/value0/agent/sessions/value1/contexts/value2", path

      path = client.context_path project: "value0", environment: "value1", user: "value2", session: "value3", context: "value4"
      assert_equal "projects/value0/agent/environments/value1/users/value2/sessions/value3/contexts/value4", path
    end
  end

  def test_session_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Dialogflow::V2::Sessions::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.session_path project: "value0", session: "value1"
      assert_equal "projects/value0/agent/sessions/value1", path

      path = client.session_path project: "value0", environment: "value1", user: "value2", session: "value3"
      assert_equal "projects/value0/agent/environments/value1/users/value2/sessions/value3", path
    end
  end

  def test_session_entity_type_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Dialogflow::V2::Sessions::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.session_entity_type_path project: "value0", session: "value1", entity_type: "value2"
      assert_equal "projects/value0/agent/sessions/value1/entityTypes/value2", path

      path = client.session_entity_type_path project: "value0", environment: "value1", user: "value2", session: "value3", entity_type: "value4"
      assert_equal "projects/value0/agent/environments/value1/users/value2/sessions/value3/entityTypes/value4", path
    end
  end
end