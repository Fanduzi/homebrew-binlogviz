cask "binlogviz" do
  version "0.26.1"

  on_macos do
    on_intel do
      sha256 "cffabd64cbf216e9ab9f8fd809d1a105c95644be9932b97db790966b82cb7df2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.1/binlogviz_0.26.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "dfe4fa869ddcce72cb9eaa4a43d37598dc6206c4dd27c17143bd4508feba5cd1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.1/binlogviz_0.26.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "7e139bbbfb2357adcc2c69b7788823c2fb010436a41121ea1d09136815ef4071"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.1/binlogviz_0.26.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "04650ef2cb19dd6044751ca43ed3296f8f93eb9d5f85197322f980426928e88c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.26.1/binlogviz_0.26.1_linux_arm64.tar.gz",
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
