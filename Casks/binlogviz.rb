cask "binlogviz" do
  version "0.21.1"

  on_macos do
    on_intel do
      sha256 "53afbc10818c42978aa85e4437391e6e89e444284a69958bd405c409ef1d472f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.1/binlogviz_0.21.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "0751e3d70f593dd94824e8236fd8c864d2834f9e33b4e601d72a719ddc72a40e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.1/binlogviz_0.21.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "ade71b038c31ac9886b0e6e72a8454db25e728ab0eca3837dec5643f1f879bc0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.1/binlogviz_0.21.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ccf402d0c4b54ee1197e94b8c5d01bb74f88fd8a8817f4aa883765298f4568dc"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.1/binlogviz_0.21.1_linux_arm64.tar.gz",
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
