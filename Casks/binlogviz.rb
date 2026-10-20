cask "binlogviz" do
  version "0.34.1"

  on_macos do
    on_intel do
      sha256 "43110e286c51766ce9c0132d50c0a200d4ef7b7cb22439f9e0e49f9dd7ee2187"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.1/binlogviz_0.34.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "6c4826db31d6585f6b9ece2b5295dddc62dee982ad134069e85550be68a705df"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.1/binlogviz_0.34.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "96582cb63c49dbaacc02c63799672234d1b4b3e219f86f5c1aab2d9df40f0a66"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.1/binlogviz_0.34.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "90c3119cb574b02eb1af1acd5fa2eca8866d13bde11023914a2d7eed8c3c7d88"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.1/binlogviz_0.34.1_linux_arm64.tar.gz",
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
