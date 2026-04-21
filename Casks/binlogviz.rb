cask "binlogviz" do
  version "0.20.1"

  on_macos do
    on_intel do
      sha256 "177fe09c51a130cbb07de144dccf9d440694ac1c08c560f6d30d02f2ae1b94ec"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.1/binlogviz_0.20.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "d4a330d07cba7c6c6f8489b02113394a3c87e90e7c1fd6d5fd82ffb5709f6466"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.1/binlogviz_0.20.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "099b74295602d213d41d80ced4abe061eecefb71007dace63e4c722322435d4d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.1/binlogviz_0.20.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "945caf1f258bb88db8a6dab092049214d70b8e82278ab16275c7e902be2efaf2"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.1/binlogviz_0.20.1_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
