cask "binlogviz" do
  version "0.23.17"

  on_macos do
    on_intel do
      sha256 "bcfbeb99104d3223a2508b0fbb4c06d5b7c3ed223433fbde0cc28f645d63f7dc"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.17/binlogviz_0.23.17_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "bde2b1385e4acbea86db5f6799e5b4160daf33eae0ee4ac14d02070715be8ac8"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.17/binlogviz_0.23.17_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "fc69f303e54ede617f466615c38cedf417e35a624e972a535ca7dc7df1f422a2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.17/binlogviz_0.23.17_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "6d5cf57323e2afe00ea8d78618ca8b0fc9f2801d571b6324bfa875bc86e5b976"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.17/binlogviz_0.23.17_linux_arm64.tar.gz",
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
