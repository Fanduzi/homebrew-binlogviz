cask "binlogviz" do
  version "0.23.27"

  on_macos do
    on_intel do
      sha256 "66dc278b22b417f692a24c5b8d8a3a242ff989c4b7315f810b4128ba0cb99778"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.27/binlogviz_0.23.27_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "2221ae0ba20984f5a212370a2a27287c54472ad3dee1bee14887869dae05adc0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.27/binlogviz_0.23.27_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "cc7af4ca216f80dc48203682d1b9509627a7343d121c7e47844809077588b80e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.27/binlogviz_0.23.27_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "23f8388f0f50f5fc09c5d1c00f73b6f7aec66ed42d60df34ea8dddf9902b58b8"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.27/binlogviz_0.23.27_linux_arm64.tar.gz",
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
