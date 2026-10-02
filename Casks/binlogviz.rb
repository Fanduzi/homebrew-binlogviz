cask "binlogviz" do
  version "0.23.8"

  on_macos do
    on_intel do
      sha256 "668cae8b8b6ddc783cb56d2ab2989c80d0482a1180e144e22e149f5b9e261509"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.8/binlogviz_0.23.8_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "677588d5aca42f5236165d255e4da509ce55285aed2b0327dc3a8121cb97a070"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.8/binlogviz_0.23.8_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "65bb468d4eba555a561346558eb3afe696d331b8dae4bddfb5e14bb78a5bf0a0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.8/binlogviz_0.23.8_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "8f23d2f79c836e840fb232155a4798af7e99574c6d8c73286ab8db5ccfd2c693"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.8/binlogviz_0.23.8_linux_arm64.tar.gz",
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
