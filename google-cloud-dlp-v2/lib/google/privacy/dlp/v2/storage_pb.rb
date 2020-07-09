# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/privacy/dlp/v2/storage.proto

require 'google/protobuf'

require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/privacy/dlp/v2/storage.proto", :syntax => :proto3) do
    add_message "google.privacy.dlp.v2.InfoType" do
      optional :name, :string, 1
    end
    add_message "google.privacy.dlp.v2.StoredType" do
      optional :name, :string, 1
      optional :create_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "google.privacy.dlp.v2.CustomInfoType" do
      optional :info_type, :message, 1, "google.privacy.dlp.v2.InfoType"
      optional :likelihood, :enum, 6, "google.privacy.dlp.v2.Likelihood"
      repeated :detection_rules, :message, 7, "google.privacy.dlp.v2.CustomInfoType.DetectionRule"
      optional :exclusion_type, :enum, 8, "google.privacy.dlp.v2.CustomInfoType.ExclusionType"
      oneof :type do
        optional :dictionary, :message, 2, "google.privacy.dlp.v2.CustomInfoType.Dictionary"
        optional :regex, :message, 3, "google.privacy.dlp.v2.CustomInfoType.Regex"
        optional :surrogate_type, :message, 4, "google.privacy.dlp.v2.CustomInfoType.SurrogateType"
        optional :stored_type, :message, 5, "google.privacy.dlp.v2.StoredType"
      end
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.Dictionary" do
      oneof :source do
        optional :word_list, :message, 1, "google.privacy.dlp.v2.CustomInfoType.Dictionary.WordList"
        optional :cloud_storage_path, :message, 3, "google.privacy.dlp.v2.CloudStoragePath"
      end
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.Dictionary.WordList" do
      repeated :words, :string, 1
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.Regex" do
      optional :pattern, :string, 1
      repeated :group_indexes, :int32, 2
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.SurrogateType" do
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.DetectionRule" do
      oneof :type do
        optional :hotword_rule, :message, 1, "google.privacy.dlp.v2.CustomInfoType.DetectionRule.HotwordRule"
      end
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.DetectionRule.Proximity" do
      optional :window_before, :int32, 1
      optional :window_after, :int32, 2
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.DetectionRule.LikelihoodAdjustment" do
      oneof :adjustment do
        optional :fixed_likelihood, :enum, 1, "google.privacy.dlp.v2.Likelihood"
        optional :relative_likelihood, :int32, 2
      end
    end
    add_message "google.privacy.dlp.v2.CustomInfoType.DetectionRule.HotwordRule" do
      optional :hotword_regex, :message, 1, "google.privacy.dlp.v2.CustomInfoType.Regex"
      optional :proximity, :message, 2, "google.privacy.dlp.v2.CustomInfoType.DetectionRule.Proximity"
      optional :likelihood_adjustment, :message, 3, "google.privacy.dlp.v2.CustomInfoType.DetectionRule.LikelihoodAdjustment"
    end
    add_enum "google.privacy.dlp.v2.CustomInfoType.ExclusionType" do
      value :EXCLUSION_TYPE_UNSPECIFIED, 0
      value :EXCLUSION_TYPE_EXCLUDE, 1
    end
    add_message "google.privacy.dlp.v2.FieldId" do
      optional :name, :string, 1
    end
    add_message "google.privacy.dlp.v2.PartitionId" do
      optional :project_id, :string, 2
      optional :namespace_id, :string, 4
    end
    add_message "google.privacy.dlp.v2.KindExpression" do
      optional :name, :string, 1
    end
    add_message "google.privacy.dlp.v2.DatastoreOptions" do
      optional :partition_id, :message, 1, "google.privacy.dlp.v2.PartitionId"
      optional :kind, :message, 2, "google.privacy.dlp.v2.KindExpression"
    end
    add_message "google.privacy.dlp.v2.CloudStorageRegexFileSet" do
      optional :bucket_name, :string, 1
      repeated :include_regex, :string, 2
      repeated :exclude_regex, :string, 3
    end
    add_message "google.privacy.dlp.v2.CloudStorageOptions" do
      optional :file_set, :message, 1, "google.privacy.dlp.v2.CloudStorageOptions.FileSet"
      optional :bytes_limit_per_file, :int64, 4
      optional :bytes_limit_per_file_percent, :int32, 8
      repeated :file_types, :enum, 5, "google.privacy.dlp.v2.FileType"
      optional :sample_method, :enum, 6, "google.privacy.dlp.v2.CloudStorageOptions.SampleMethod"
      optional :files_limit_percent, :int32, 7
    end
    add_message "google.privacy.dlp.v2.CloudStorageOptions.FileSet" do
      optional :url, :string, 1
      optional :regex_file_set, :message, 2, "google.privacy.dlp.v2.CloudStorageRegexFileSet"
    end
    add_enum "google.privacy.dlp.v2.CloudStorageOptions.SampleMethod" do
      value :SAMPLE_METHOD_UNSPECIFIED, 0
      value :TOP, 1
      value :RANDOM_START, 2
    end
    add_message "google.privacy.dlp.v2.CloudStorageFileSet" do
      optional :url, :string, 1
    end
    add_message "google.privacy.dlp.v2.CloudStoragePath" do
      optional :path, :string, 1
    end
    add_message "google.privacy.dlp.v2.BigQueryOptions" do
      optional :table_reference, :message, 1, "google.privacy.dlp.v2.BigQueryTable"
      repeated :identifying_fields, :message, 2, "google.privacy.dlp.v2.FieldId"
      optional :rows_limit, :int64, 3
      optional :rows_limit_percent, :int32, 6
      optional :sample_method, :enum, 4, "google.privacy.dlp.v2.BigQueryOptions.SampleMethod"
      repeated :excluded_fields, :message, 5, "google.privacy.dlp.v2.FieldId"
    end
    add_enum "google.privacy.dlp.v2.BigQueryOptions.SampleMethod" do
      value :SAMPLE_METHOD_UNSPECIFIED, 0
      value :TOP, 1
      value :RANDOM_START, 2
    end
    add_message "google.privacy.dlp.v2.StorageConfig" do
      optional :timespan_config, :message, 6, "google.privacy.dlp.v2.StorageConfig.TimespanConfig"
      oneof :type do
        optional :datastore_options, :message, 2, "google.privacy.dlp.v2.DatastoreOptions"
        optional :cloud_storage_options, :message, 3, "google.privacy.dlp.v2.CloudStorageOptions"
        optional :big_query_options, :message, 4, "google.privacy.dlp.v2.BigQueryOptions"
        optional :hybrid_options, :message, 9, "google.privacy.dlp.v2.HybridOptions"
      end
    end
    add_message "google.privacy.dlp.v2.StorageConfig.TimespanConfig" do
      optional :start_time, :message, 1, "google.protobuf.Timestamp"
      optional :end_time, :message, 2, "google.protobuf.Timestamp"
      optional :timestamp_field, :message, 3, "google.privacy.dlp.v2.FieldId"
      optional :enable_auto_population_of_timespan_config, :bool, 4
    end
    add_message "google.privacy.dlp.v2.HybridOptions" do
      optional :description, :string, 1
      repeated :required_finding_label_keys, :string, 2
      map :labels, :string, :string, 3
      optional :table_options, :message, 4, "google.privacy.dlp.v2.TableOptions"
    end
    add_message "google.privacy.dlp.v2.BigQueryKey" do
      optional :table_reference, :message, 1, "google.privacy.dlp.v2.BigQueryTable"
      optional :row_number, :int64, 2
    end
    add_message "google.privacy.dlp.v2.DatastoreKey" do
      optional :entity_key, :message, 1, "google.privacy.dlp.v2.Key"
    end
    add_message "google.privacy.dlp.v2.Key" do
      optional :partition_id, :message, 1, "google.privacy.dlp.v2.PartitionId"
      repeated :path, :message, 2, "google.privacy.dlp.v2.Key.PathElement"
    end
    add_message "google.privacy.dlp.v2.Key.PathElement" do
      optional :kind, :string, 1
      oneof :id_type do
        optional :id, :int64, 2
        optional :name, :string, 3
      end
    end
    add_message "google.privacy.dlp.v2.RecordKey" do
      repeated :id_values, :string, 5
      oneof :type do
        optional :datastore_key, :message, 2, "google.privacy.dlp.v2.DatastoreKey"
        optional :big_query_key, :message, 3, "google.privacy.dlp.v2.BigQueryKey"
      end
    end
    add_message "google.privacy.dlp.v2.BigQueryTable" do
      optional :project_id, :string, 1
      optional :dataset_id, :string, 2
      optional :table_id, :string, 3
    end
    add_message "google.privacy.dlp.v2.BigQueryField" do
      optional :table, :message, 1, "google.privacy.dlp.v2.BigQueryTable"
      optional :field, :message, 2, "google.privacy.dlp.v2.FieldId"
    end
    add_message "google.privacy.dlp.v2.EntityId" do
      optional :field, :message, 1, "google.privacy.dlp.v2.FieldId"
    end
    add_message "google.privacy.dlp.v2.TableOptions" do
      repeated :identifying_fields, :message, 1, "google.privacy.dlp.v2.FieldId"
    end
    add_enum "google.privacy.dlp.v2.Likelihood" do
      value :LIKELIHOOD_UNSPECIFIED, 0
      value :VERY_UNLIKELY, 1
      value :UNLIKELY, 2
      value :POSSIBLE, 3
      value :LIKELY, 4
      value :VERY_LIKELY, 5
    end
    add_enum "google.privacy.dlp.v2.FileType" do
      value :FILE_TYPE_UNSPECIFIED, 0
      value :BINARY_FILE, 1
      value :TEXT_FILE, 2
      value :IMAGE, 3
      value :WORD, 5
      value :PDF, 6
      value :AVRO, 7
      value :CSV, 8
      value :TSV, 9
    end
  end
end

module Google
  module Cloud
    module Dlp
      module V2
        InfoType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.InfoType").msgclass
        StoredType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.StoredType").msgclass
        CustomInfoType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType").msgclass
        CustomInfoType::Dictionary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.Dictionary").msgclass
        CustomInfoType::Dictionary::WordList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.Dictionary.WordList").msgclass
        CustomInfoType::Regex = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.Regex").msgclass
        CustomInfoType::SurrogateType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.SurrogateType").msgclass
        CustomInfoType::DetectionRule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.DetectionRule").msgclass
        CustomInfoType::DetectionRule::Proximity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.DetectionRule.Proximity").msgclass
        CustomInfoType::DetectionRule::LikelihoodAdjustment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.DetectionRule.LikelihoodAdjustment").msgclass
        CustomInfoType::DetectionRule::HotwordRule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.DetectionRule.HotwordRule").msgclass
        CustomInfoType::ExclusionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CustomInfoType.ExclusionType").enummodule
        FieldId = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.FieldId").msgclass
        PartitionId = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.PartitionId").msgclass
        KindExpression = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.KindExpression").msgclass
        DatastoreOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.DatastoreOptions").msgclass
        CloudStorageRegexFileSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStorageRegexFileSet").msgclass
        CloudStorageOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStorageOptions").msgclass
        CloudStorageOptions::FileSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStorageOptions.FileSet").msgclass
        CloudStorageOptions::SampleMethod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStorageOptions.SampleMethod").enummodule
        CloudStorageFileSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStorageFileSet").msgclass
        CloudStoragePath = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.CloudStoragePath").msgclass
        BigQueryOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.BigQueryOptions").msgclass
        BigQueryOptions::SampleMethod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.BigQueryOptions.SampleMethod").enummodule
        StorageConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.StorageConfig").msgclass
        StorageConfig::TimespanConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.StorageConfig.TimespanConfig").msgclass
        HybridOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.HybridOptions").msgclass
        BigQueryKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.BigQueryKey").msgclass
        DatastoreKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.DatastoreKey").msgclass
        Key = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.Key").msgclass
        Key::PathElement = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.Key.PathElement").msgclass
        RecordKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.RecordKey").msgclass
        BigQueryTable = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.BigQueryTable").msgclass
        BigQueryField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.BigQueryField").msgclass
        EntityId = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.EntityId").msgclass
        TableOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.TableOptions").msgclass
        Likelihood = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.Likelihood").enummodule
        FileType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.privacy.dlp.v2.FileType").enummodule
      end
    end
  end
end
