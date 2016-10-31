module Fog
  module SCP
    class Mock
      def self.data
        @data ||= Hash.new do |hash, key|
          hash[key] = []
        end
      end

      def initialize(address, username, options)
        @address  = address
        @username = username
        @options  = options
      end

      def upload(local_path, remote_path, upload_options = {})
        self.class.data[@address] << { :username       => @username,
                                       :options        => @options,
                                       :local_path     => local_path,
                                       :remote_path    => remote_path,
                                       :upload_options => upload_options }
      end

      def download(remote_path, local_path, download_options = {})
        self.class.data[@address] << { :username         => @username,
                                       :options          => @options,
                                       :remote_path      => remote_path,
                                       :local_path       => local_path,
                                       :download_options => download_options }
      end
    end
  end
end
